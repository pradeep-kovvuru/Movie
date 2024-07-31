//
//  MovieListVM.swift
//  Movie
//
//  Created by Reddy, Kovvuru Pradeep Kumar (Cognizant) on 31/07/24.
//

import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [MovieViewModel] = []
    func search(name: String) async {
        do {
            let movies = try await Webservice().getMovies(searchTerm: name)
            self.movies = movies.map(MovieViewModel.init)
        } catch {
            print(error)
        }
    }
}
struct MovieViewModel {
    let movie: Search
    var imdbId: String {
        movie.imdbID
    }
    var title: String {
        movie.title
    }
    var year: String {
        movie.year
    }
    var poster: URL? {
        URL(string: movie.poster)
    }
}
