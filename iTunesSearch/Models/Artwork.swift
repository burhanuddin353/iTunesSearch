//
//  Artwork.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 29/12/20.
//

import Foundation

protocol Artwork {

    var artworkUrl60: URL { get set }
    var artworkUrl100: URL { get set }
    var artworkUrl200: URL { get }
    var artworkUrl400: URL { get }
}

extension Artwork {

    var artworkUrl200: URL {
        let urlString = artworkUrl100.absoluteString.replacingOccurrences(of: "100x100bb", with: "200x200bb")
        return URL(string: urlString)!
    }

    var artworkUrl400: URL {
        let urlString = artworkUrl100.absoluteString.replacingOccurrences(of: "100x100bb", with: "400x400bb")
        return URL(string: urlString)!
    }

}
