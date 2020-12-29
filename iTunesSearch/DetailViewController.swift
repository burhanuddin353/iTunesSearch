//
//  DetailViewController.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 29/12/20.
//

import UIKit
import AlamofireImage

class DetailViewController: UITableViewController {

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!

    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    var dateFormatter: DateFormatter = {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM, yyyy"
        return dateFormatter
    }()

    var item: Any?
    var mediaType: MediaType?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let mediaType = mediaType {
            title = mediaType.displayName
        }
        var imageUrl: URL?
        var name: String?
        var subtitle: String?
        var date: String?

        switch item {
        case let item as Artwork & Track:

            imageUrl = item.artworkUrl400
            name = item.trackName
            subtitle = item.artistName
            date = dateFormatter.string(from: item.releaseDate)
            priceLabel.text = item.formattedPrice

        case let artist as Artist:
            imageUrl = nil
            name = artist.artistName
            subtitle = artist.artistType

        default: break
        }

        if let url = imageUrl {
            imageView.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "ImagePlaceholder"))
        }
        titleLabel.text = name
        subtitleLabel.text = subtitle
        releaseDateLabel.text = date
    }
}
