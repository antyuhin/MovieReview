//
//  Api.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 30.09.2021.
//

import Foundation

class Api {
    let urlString: String
    var reviewResponse: [ReviewData] = []
    var criticsResponse: [CriticData] = []
    
    func getReviews(completion: @escaping ([ReviewData]) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            do {
                let reviews: ReviewResponse = try JSONDecoder().decode(ReviewResponse.self, from: data!)
                self.reviewResponse = reviews.results
            }
            catch {
                print("JSON decode failed!", error)
            }
            
            DispatchQueue.main.async {
                completion(self.reviewResponse)
            }
        }.resume()
    }
    
    func getCritics(completion: @escaping ([CriticData]) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            do {
                let critics: CriticResponse = try JSONDecoder().decode(CriticResponse.self, from: data!)
                self.criticsResponse = critics.results
            }
            catch {
                print("JSON decode failed!", error)
            }
            
            DispatchQueue.main.async {
                completion(self.criticsResponse)
            }
        }.resume()
    }

    
    init(reviewResponse: [ReviewData], urlString: String) {
        self.reviewResponse = reviewResponse
        self.urlString = urlString
    }
    
    init(criticsResponse: [CriticData], urlString: String) {
        self.criticsResponse = criticsResponse
        self.urlString = urlString
    }
}
