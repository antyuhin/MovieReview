//
//  ReviewResponse.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 29.09.2021.
//

import Foundation

struct ReviewResponse: Decodable {
    var num_results: Int
    var results: [ReviewData]
}

struct ReviewData: Decodable, Hashable, Equatable {
    static func == (lhs: ReviewData, rhs: ReviewData) -> Bool {
        return lhs.display_title == rhs.display_title
    }
    
    
//    var id: UUID = UUID()
    var display_title: String
    var byline: String
    var headline: String
    var summary_short: String
    var publication_date: String
    var link: Link
    var multimedia: MultimediaReview
}

struct Link: Decodable, Hashable {
    var type: String
    var url: String
}

struct MultimediaReview: Decodable, Hashable {
    var src: String
    var height: Int
    var width: Int
}
