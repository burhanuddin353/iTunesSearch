//
//  ResultsGridHeader.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 29/12/20.
//

import UIKit

class ResultsGridHeader: UICollectionReusableView {

    @IBOutlet private weak var textLabel: UILabel!

    var text: String? {
        didSet {
            textLabel.text = text
        }
    }
}
