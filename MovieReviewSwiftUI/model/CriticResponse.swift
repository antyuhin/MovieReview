//
//  CriticResponse.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 29.09.2021.
//

import Foundation

struct CriticResponse: Decodable {
    var num_results: Int
    var results: [CriticData]
}

struct CriticData: Decodable, Hashable, Equatable {
    static func == (lhs: CriticData, rhs: CriticData) -> Bool {
        return lhs.display_name == rhs.display_name
    }
    
    var display_name: String
    var sort_name: String
    var status: String
    var bio: String
    var multimedia: Multimedia?
}

struct Multimedia: Decodable, Hashable {
    var resource: Resource
}

struct Resource: Decodable, Hashable {
    var type: String
    var src: String
    var height: Int
    var width: Int
}
