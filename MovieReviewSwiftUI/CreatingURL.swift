//
//  CreatingURL.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 04.10.2021.
//

import Foundation

class CreatingURL {
    func url(criticData: CriticData) -> String {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.nytimes.com"
        components.path = "/svc/movies/v2/reviews/search.json"
        components.query = "api-key=vTBuxnD62gb59RpEgsd2eLQe5JcAKoXR&reviewer=" + criticData.sort_name
        return components.string!
    }
}
