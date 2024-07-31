//
//  ContentView.swift
//  Movie
//
//  Created by Reddy, Kovvuru Pradeep Kumar  on 30/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var movieListVM = MovieListViewModel()
    @StateObject private var movieDataList = MovieListViewModel()
    @State private var searchText: String = ""
//    var movieData = MovieData()
    var body: some View {
        NavigationStack {
            VStack {
                Text("Search for Movies")
                    .foregroundStyle(.gray)
                    .font(.headline)
                    .fontWeight(.bold)
            List(movieListVM.movies, id: \.imdbId) { movie in
                NavigationLink {
                    DetailView(movie: movie)
                } label: {
                    HStack {
                        AsyncImage(url: movie.poster
                                   , content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: 100)
                        }, placeholder: {
                            ProgressView()
                        })
                        VStack(alignment: .leading) {
                            Text(movie.title)
                            Text(movie.year)
                        }
                        
                    }
                }
                
            }.listStyle(.plain)
                .searchable(text: $searchText)
            
                .onChange(of: searchText) { value in
                    async {
                        if !value.isEmpty &&  value.count > 3 {
                            await movieListVM.search(name: value)
                        } else {
                            movieListVM.movies.removeAll()
                        }
                    }
                }
                .navigationTitle("Movies")
                        }
    }
    }
}
