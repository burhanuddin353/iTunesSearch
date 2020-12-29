//
//  SearchViewController.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 27/12/20.
//

import UIKit
import TagListView
import MBProgressHUD

class SearchViewController: UIViewController {

    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var tagListView: TagListView!

    private var selectedMediaTypes = Set<MediaType>()

    override func viewDidLoad() {
        super.viewDidLoad()

        tagListView.textFont = .systemFont(ofSize: 16)
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        switch segue.identifier {

        case "segueToMediaTypesViewController":
            guard let navigationController = segue.destination as? UINavigationController,
                  let mediaTypesVC = navigationController.topViewController as? MediaTypesViewController else { return }

            mediaTypesVC.selectedMediaTypes = selectedMediaTypes
            mediaTypesVC.delegate = self

        case "seagueToResultsContainerViewController":
            guard let navigationController = segue.destination as? UINavigationController,
                  let resultsContainerVC =
                    navigationController.topViewController as? ResultsContainerViewController else { return }
            guard let itemsDictionary = sender as? [MediaType: [Any]] else { return }
            resultsContainerVC.itemsDictionary = itemsDictionary

        default: break
        }
    }
}

// MARK: - IBActions
extension SearchViewController {

    @IBAction func unwind( _ seg: UIStoryboardSegue) {}

    @IBAction private func submitClicked(_ button: UIButton) {
        guard !searchTextField.text.isNilOrEmpty else { return }
        guard !selectedMediaTypes.isEmpty else { return }

        var itemsDictionary = [MediaType: [Any]]()
        let dispatchGroup = DispatchGroup()
        MBProgressHUD.showAdded(to: view, animated: true)
        selectedMediaTypes.forEach { (mediaType) in

            dispatchGroup.enter()
            Network.shared.iTunesItems(for: searchTextField.text!, mediaType: mediaType) { (result) in
                dispatchGroup.leave()

                result.ifSuccess {
                    itemsDictionary[mediaType] = result.value!
                }

                result.ifFailure {}
            }
        }

        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let strongSelf = self else { return }
            MBProgressHUD.hide(for: strongSelf.view, animated: true)
            strongSelf.performSegue(withIdentifier: "seagueToResultsContainerViewController", sender: itemsDictionary)
        }
    }
}

// MARK: - MediaTypesViewController Delegate
extension SearchViewController: MediaTypesViewControllerDelegate {

    func mediaTypesViewController(_ mediaTypesViewController: MediaTypesViewController,
                                  didSelect mediaTypes: Set<MediaType>) {

        tagListView.removeAllTags()
        selectedMediaTypes = mediaTypes
        tagListView.addTags(mediaTypes.map({ $0.displayName }).sorted())
    }
}

// MARK: - MediaTypesViewController Delegate
extension SearchViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.endEditing(true)
        return true
    }
}
