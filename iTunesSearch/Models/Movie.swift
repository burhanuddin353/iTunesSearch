//
//  Movie.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 24/12/20.
//

import Foundation

class Movie: Decodable, Track, Artwork {

    var trackId: Int
    var artistName: String
    var trackName: String
    var trackViewUrl: URL
    var previewUrl: URL?
    var artworkUrl30: URL
    var artworkUrl60: URL
    var artworkUrl100: URL
    var trackPrice: Double?
    var trackRentalPrice: Double?
    var country: String
    var currency: String
    var primaryGenreName: String
    var contentAdvisoryRating: String
    var longDescription: String
    var releaseDate: Date

    var formattedPrice: String {
        "\(currency) \(trackPrice ?? 0)"
    }
}
