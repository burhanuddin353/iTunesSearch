//
//  Artist.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 24/12/20.
//

import Foundation

class Artist: Decodable {

    var artistType: String
    var artistName: String
    var artistLinkUrl: String
    var artistId: Int
    var primaryGenreName: String
}
