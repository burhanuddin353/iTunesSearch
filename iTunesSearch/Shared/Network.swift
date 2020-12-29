//
//  Network.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 18/12/20.
//

import Foundation
import Alamofire

enum NetworkError: Error {

    case invalidURL
    case serverDown
    case invalidResponse
    case invalidParameters
}

extension NetworkError: LocalizedError {

    public var errorDescription: String? {
        switch self {

        case .invalidURL:
            return NSLocalizedString("Bad Error", comment: "My error")

        case .serverDown:
            return NSLocalizedString("Server is down. Please try again.", comment: "My error")

        case .invalidResponse:
            return NSLocalizedString("Server is down. Please try again.", comment: "My error")

        case .invalidParameters:
            return NSLocalizedString("BadError", comment: "My error")
        }
    }
}

class Network {

    static let shared = Network()

    private var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()

    private init() {}

    func iTunesItems(for term: String, mediaType: MediaType, completionHandler: @escaping (Result<[Any]>) -> Void) {

        let parameters = ["term": term,
                          "entity": mediaType.entityName]
        request(URL.iTunesSearch, parameters: parameters).responseJSON { (response) in

            response.result.ifSuccess {

                if let value = response.value as? [String: Any],
                   let results = value["results"] as? [[String: Any]],
                   let data = try? JSONSerialization.data(withJSONObject: results, options: []) {

                    var items: [Any]
                    do {
                        switch mediaType {
                        case .album:
                            items = try self.decoder.decode([Album].self, from: data)
                        case .artist:
                            items = try self.decoder.decode([Artist].self, from: data)
                        case .book:
                            items = try self.decoder.decode([Book].self, from: data)
                        case .movie:
                            items = try self.decoder.decode([Movie].self, from: data)
                        case .musicVideo:
                            items = try self.decoder.decode([MusicVideo].self, from: data)
                        case .podcast:
                            items = try self.decoder.decode([Podcast].self, from: data)
                        case .song:
                            items = try self.decoder.decode([Song].self, from: data)
                        }

                    } catch {
                        print(error.localizedDescription)
                        completionHandler(.failure(NetworkError.invalidResponse))
                        return
                    }
                    completionHandler(.success(items))

                } else {
                    completionHandler(.failure(NetworkError.invalidResponse))
                }
            }

            response.result.ifFailure {
                completionHandler(.failure(response.result.error!))
            }
        }
    }

}
