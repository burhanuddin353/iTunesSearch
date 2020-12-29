//
//  Song.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 24/12/20.
//

import Foundation

class Song: Decodable, Track, Artwork {

    var trackId: Int
    var artistName: String
    var trackName: String
    var artistViewUrl: URL?
    var trackViewUrl: URL
    var previewUrl: URL
    var artworkUrl30: URL
    var artworkUrl60: URL
    var artworkUrl100: URL
    var collectionPrice: Float?
    var trackPrice: Float
    var releaseDate: Date
    var country: String
    var currency: String
    var primaryGenreName: String

    var formattedPrice: String {
        "\(currency) \(trackPrice)"
    }
}
