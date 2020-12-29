//
//  SearchResultsListViewController.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 27/12/20.
//

import UIKit
import AlamofireImage

private let reuseIdentifier = "ResultListCell"

class ResultsListViewController: UITableViewController {

    var itemsDictionary = [MediaType: [Any]]()

    private var itemsKeys: [MediaType] {
        itemsDictionary.keys.sorted(by: { $0.displayName < $1.displayName })
    }

    private func item(for indexPath: IndexPath) -> Any? {

        let itemKey = itemsKeys[indexPath.section]
        let items = itemsDictionary[itemKey]
        return items?[indexPath.row]
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        itemsKeys.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let itemKey = itemsKeys[section]
        return itemsDictionary[itemKey]!.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)

        var imageUrl: URL?
        var name: String?
        var subtitle: String?

        switch item(for: indexPath)! {
        case let item as Artwork & Track:
            imageUrl = item.artworkUrl100
            name = item.trackName
            subtitle = item.artistName

        case let artist as Artist:
            imageUrl = nil
            name = artist.artistName
            subtitle = artist.artistType

        default: break
        }

        if let url = imageUrl {
            cell.imageView?.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "ImagePlaceholder"))
        }
        cell.textLabel?.text = name
        cell.detailTextLabel?.text = subtitle

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        itemsKeys[section].displayName
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {

        case "segueToDetailViewController":
            guard let detailViewController = segue.destination as? DetailViewController else { return }

            let indexPath = tableView.indexPathForSelectedRow!
            detailViewController.item = item(for: indexPath)
            detailViewController.mediaType = itemsKeys[indexPath.section]

        default: break

        }
    }
}
