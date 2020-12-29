//
//  Book.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 24/12/20.
//

import Foundation

class Book: Decodable, Track, Artwork {

    var artworkUrl60: URL
    var artworkUrl100: URL
    var artistViewUrl: URL?
    var trackName: String
    var trackId: Int
    var trackViewUrl: URL
    var releaseDate: Date
    var formattedPrice: String
    var currency: String
    var artistName: String
    var genres: [String]
    var description: String
    var averageUserRating: Float
    var userRatingCount: Int
}
