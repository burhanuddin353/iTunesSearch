//
//  Article.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 18/12/20.
//

import Foundation

protocol Track {

    var trackName: String { get set }
    var artistName: String { get set }
    var releaseDate: Date { get set }
    var formattedPrice: String { get }
}
