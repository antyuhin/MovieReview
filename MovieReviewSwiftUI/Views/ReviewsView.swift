//
//  ReviewsView.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 29.09.2021.
//

import SwiftUI

struct ReviewsView: View {
    @State var reviews: [ReviewData] = []
    @State private var searchRequest = ""
    @ObservedObject var searchReview = Search()
    
    let reviewsURL: String
    
    var body: some View {
        NavigationView {
            VStack() {
                HStack(alignment: .center) {
                    SearchBar(search: searchReview)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text("Date")
                        }
                        .frame(width: 170, height: 32)
                        .foregroundColor(.orange)
                        .background(Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 0.1958743579)))
                        .cornerRadius(5)
                    })
                    
                }
                .padding()
                Spacer()
                ListReviews(searchReview: searchReview, reviewsURL: reviewsURL)
                .navigationTitle("Reviews")
            }
        }
    }
}

struct ReviewsView_Preview: PreviewProvider {
    static var previews: some View {
        let reviews: [ReviewData] = []
        let reviewsURL = "https://api.nytimes.com/svc/movies/v2/reviews/all.json?api-key=vTBuxnD62gb59RpEgsd2eLQe5JcAKoXR"
        ReviewsView(reviews: reviews, reviewsURL: reviewsURL)
    }
}
