//
//  TestReview.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 04.10.2021.
//

//
//  ReviewsView.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 29.09.2021.
//

import SwiftUI

struct ListReviews: View {
    @State var reviews: [ReviewData] = []
    @ObservedObject var searchReview: Search
    
    let reviewsURL: String
    
    var body: some View {
        VStack() {
            ScrollView {
                ForEach(reviews.filter({
                    searchReview.text.isEmpty ? true : $0.display_title.contains(searchReview.text)
                }), id:\.self) { review in
                    ReviewRow(reviewData: review)
                    Spacer()
                }
            }.onAppear() {
                let api = Api(reviewResponse: reviews, urlString: reviewsURL)
                api.getReviews { (reviews) in
                    self.reviews = reviews
                }
            }
            .padding()
            .navigationTitle("Reviews")
        }
    }
}

struct ListReviews_Preview: PreviewProvider {
    static var previews: some View {
        let reviews: [ReviewData] = []
        let reviewsURL = "https://api.nytimes.com/svc/movies/v2/reviews/all.json?api-key=vTBuxnD62gb59RpEgsd2eLQe5JcAKoXR"
        ReviewsView(reviews: reviews, reviewsURL: reviewsURL)
    }
}
