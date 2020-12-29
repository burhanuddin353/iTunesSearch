//
//  ArticleCell.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 19/12/20.
//

import UIKit
import AlamofireImage

class ResultGridCell: UICollectionViewCell {

    @IBOutlet private weak var photoView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    var item: Any? {
        didSet {
            guard let item = item else { return }

            var imageUrl: URL?
            var name: String?
            switch item {
            case let item as Artwork & Track:
                imageUrl = item.artworkUrl100
                name = item.trackName

            case let artist as Artist:
                imageUrl = nil
                name = artist.artistName

            default: break
            }
            if let url = imageUrl {
                photoView.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "ImagePlaceholder"))
            }
            titleLabel.text = name
        }
    }

//    var article: Article? {
//        didSet {
//            guard let article = article else { return }
//
//            titleLabel.text = article.title
//
//            if let url = article.media?.first(where: { $0.type == "image" })?
//                .mediaMetadata?.first(where: { $0.format == "Standard Thumbnail" })?
//                .url {
//                photoView.af_setImage(withURL: url)
//            }
//        }
//    }
}
