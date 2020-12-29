//
//  Album.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 24/12/20.
//

import Foundation

class Album: Artwork, Track, Decodable {

    var artistId: Int
    var artistName: String
    var collectionName: String
    var artistViewUrl: URL?
    var collectionViewUrl: URL
    var artworkUrl60: URL
    var artworkUrl100: URL
    var collectionPrice: Double
    var trackCount: Int
    var copyright: String
    var country: String
    var currency: String
    var releaseDate: Date
    var primaryGenreName: String

    var trackName: String {
        get { collectionName }
        set { collectionName = newValue }
    }

    var formattedPrice: String { "\(currency) \(collectionPrice)" }
}
