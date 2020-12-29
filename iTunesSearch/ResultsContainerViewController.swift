//
//  SearchResultsContainerViewController.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 27/12/20.
//

import UIKit

class ResultsContainerViewController: UIViewController {

    @IBOutlet private weak var layoutSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var listView: UIView!
    @IBOutlet private weak var gridView: UIView!

    var itemsDictionary = [MediaType: [Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateLayoutSegmentedControl()
    }

    private func updateLayoutSegmentedControl() {

        listView.isHidden = layoutSegmentedControl.selectedSegmentIndex == 0
        gridView.isHidden = layoutSegmentedControl.selectedSegmentIndex == 1
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {
        case "embedSearchResultsGridViewController":
            guard let resultsGridViewController = segue.destination as? ResultsGridViewController else { return }
            resultsGridViewController.itemsDictionary = itemsDictionary

        case "embedSearchResultsListViewController":
            guard let resultsListViewController = segue.destination as? ResultsListViewController else { return }
            resultsListViewController.itemsDictionary = itemsDictionary
        default:
            break
        }
    }
}

// MARK: - IBActions
extension ResultsContainerViewController {

    @IBAction private func layoutChanged(_ segmentedControl: UISegmentedControl) {
        updateLayoutSegmentedControl()
    }
}
