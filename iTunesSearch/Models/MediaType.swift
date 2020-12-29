//
//  Entity.swift
//  iTunesSearch
//
//  Created by Burhanuddin Sunelwala on 28/12/20.
//

import Foundation

enum MediaType: CaseIterable {

    case album
    case artist
    case book
    case movie
    case musicVideo
    case podcast
    case song

    var entityName: String {

        switch self {
        case .album: return "album"
        case .artist: return "allArtist"
        case .book: return "ebook"
        case .movie: return "movie"
        case .podcast: return "podcast"
        case .musicVideo: return "musicVideo"
        case .song: return "song"
        }
    }

    var displayName: String {

        switch self {
        case .album: return "Album"
        case .artist: return "Artist"
        case .book: return "Book"
        case .movie: return "Movie"
        case .podcast: return "Podcast"
        case .musicVideo: return "Music Video"
        case .song: return "Song"
        }
    }

//    func model() -> Type {
//
//        switch self {
//        case .album: return Album.self as! T.Type
//        case .artist: return Artist.self as! T.Type
//        case .book: return Book.self as! T.Type
//        case .movie: return  Movie.self as! T.Type
//        case .podcast: return Podcast.self as! T.Type
//        case .musicVideo: return MusicVideo.self as! T.Type
//        case .song: return Song.self as! T.Type
//        }
//    }
}
