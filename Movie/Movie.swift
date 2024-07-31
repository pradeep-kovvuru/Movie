//
//  Movie.swift
//  Movie
//
//  Created by Reddy, Kovvuru Pradeep Kumar (Cognizant) on 30/07/24.
//
import Foundation

struct SearchResponse: Codable {
    var search: [Search]
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

// MARK: - Search
struct Search: Codable, Identifiable {
    var id = UUID()
    var title: String
    var year: String
    var imdbID: String
    var poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case poster = "Poster"
    }
}

struct MovieData: Codable {
    var title: String
    var released: String
    var genre: String
    var plot: String
    var imdbRating: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case genre = "Genre"
        case plot = "Plot"
        case imdbRating = "imdbRating"
    }
}
