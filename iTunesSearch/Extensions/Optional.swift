//
//  Optional.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 28/12/20.
//

import Foundation

extension Optional where Wrapped: Collection {

    var isNilOrEmpty: Bool {
        switch self {
        case let collection?: return collection.isEmpty
        case nil: return true
        }
    }
}
