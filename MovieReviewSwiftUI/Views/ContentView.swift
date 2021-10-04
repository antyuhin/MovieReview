//
//  ContentView.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 28.09.2021.
//

import SwiftUI


struct ContentView: View {
    let reviewsLink = "https://api.nytimes.com/svc/movies/v2/reviews/all.json?api-key=vTBuxnD62gb59RpEgsd2eLQe5JcAKoXR"
    let criticsLink = "https://api.nytimes.com/svc/movies/v2/critics/all.json?api-key=vTBuxnD62gb59RpEgsd2eLQe5JcAKoXR"
    
    var body: some View {
        TabView {
            VStack {
                ReviewsView(reviewsURL: reviewsLink)
            }

            .tabItem {
                Image(systemName: "star.square.fill")
                Text("Reviews")
            }
            
            VStack {
                CriticsView(criticsURL: criticsLink)
            }
            .tabItem {
                Image(systemName: "person")
                Text("Critics")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        let reviews: [ReviewData] = []
        ContentView()
    }
}
