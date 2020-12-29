//
//  MediaTypesViewController.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 27/12/20.
//

import UIKit

protocol MediaTypesViewControllerDelegate: class {

    func mediaTypesViewController(_ mediaTypesViewController: MediaTypesViewController,
                                  didSelect mediaTypes: Set<MediaType>)
}

class MediaTypesViewController: UITableViewController {

    private let mediaTypes = MediaType.allCases.sorted(by: { $0.displayName < $1.displayName})
    var selectedMediaTypes = Set<MediaType>()

    weak var delegate: MediaTypesViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mediaTypes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MediaTypeCell", for: indexPath)

        let mediaType = mediaTypes[indexPath.row]
        cell.textLabel?.text = mediaType.displayName
        if selectedMediaTypes.contains(mediaType) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let mediaType = mediaTypes[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)!

        if selectedMediaTypes.contains(mediaType) {
            selectedMediaTypes.remove(mediaType)
            cell.accessoryType = .none
        } else {
            selectedMediaTypes.insert(mediaType)
            cell.accessoryType = .checkmark
        }
    }
}

// MARK: - IBActions
extension MediaTypesViewController {

    @IBAction private func doneClicked(_ barButtonItem: UIBarButtonItem) {

        delegate?.mediaTypesViewController(self, didSelect: selectedMediaTypes)
        dismiss(animated: true)
    }
}
