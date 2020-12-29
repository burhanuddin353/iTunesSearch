//
//  SearchResultsGridViewController.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 27/12/20.
//

import UIKit

private let reuseIdentifier = "ResultGridCell"

class ResultsGridViewController: UICollectionViewController {

    var itemsDictionary = [MediaType: [Any]]()

    private var itemsKeys: [MediaType] {
        itemsDictionary.keys.sorted(by: { $0.displayName < $1.displayName })
    }

    private func item(for indexPath: IndexPath) -> Any? {

        let itemKey = itemsKeys[indexPath.section]
        let items = itemsDictionary[itemKey]
        return items?[indexPath.row]
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        itemsKeys.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        let itemKey = itemsKeys[section]
        return itemsDictionary[itemKey]!.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                            for: indexPath) as? ResultGridCell else {
            return UICollectionViewCell()
        }

        let itemKey = itemsKeys[indexPath.section]
        let items = itemsDictionary[itemKey]
        cell.item = items![indexPath.row]

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {

        guard let sectionHeader =
                collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                withReuseIdentifier: "ResultsGridHeader",
                                                                for: indexPath) as? ResultsGridHeader,
              kind == UICollectionView.elementKindSectionHeader else {

            return UICollectionReusableView()
        }
        sectionHeader.text = itemsKeys[indexPath.section].displayName
        return sectionHeader
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {

        case "segueToDetailViewController":
            guard let detailViewController = segue.destination as? DetailViewController else { return }

            let indexPath = collectionView.indexPathsForSelectedItems!.first!
            detailViewController.item = item(for: indexPath)
            detailViewController.mediaType = itemsKeys[indexPath.section]

        default: break

        }
    }
}
