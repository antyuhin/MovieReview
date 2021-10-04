//
//  CriticBio.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 04.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CriticBio: View {
    let criticData: CriticData
    let searchReview = Search()
//    let imageURL = "http://static01.nyt.com/images/2015/10/07/topics/ao-scott/ao-scott-articleInline.jpg"
    
    let reviewsURL = CreatingURL()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                                        Image("Image")
                                            .resizable()
                                            .frame(width: 130, height: 130)
                                            .cornerRadius(10)
                                            .padding()
//                    WebImage(url: URL(string: (imageURL)))
//                        .renderingMode(.original)
//                        .resizable()
//                        .frame(width: 130, height: 130)
//                        .cornerRadius(10)
//                        .padding()
                    Spacer()
                    VStack {
                        Text(criticData.display_name)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                        Text(criticData.status)
                            .padding(.top, 30)
                    }
                    .padding(.trailing, 80)
                }
                .padding(.top, 30)
                
                Text(criticData.bio)
                    .multilineTextAlignment(.leading)
                    .multilineTextAlignment(.trailing)
                    .padding()
            }
            
            HStack {
                Text("Critic's reviews")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
                
            }
            ListReviews(searchReview: searchReview, reviewsURL: reviewsURL.url(criticData: criticData))
        }
    }
}

struct CriticBio_Preview: PreviewProvider {
    static var previews: some View {
        let resource = Resource(type: "", src: "http://static01.nyt.com/images/2015/10/07/topics/ao-scott/ao-scott-articleInline.jpg", height: 163, width: 220)
        let multimedia = Multimedia(resource: resource)
        let criticData = CriticData(display_name: "A. O. Scott", sort_name: "", status: "full-time", bio: "A. O. Scott joined The New York Times as a film critic in January 2000, and was named a chief critic in 2004. Previously, Mr. Scott had been the lead Sunday book reviewer for Newsday and a frequent contributor to Slate, The New York Review of Books, and many other publications. \n\nIn the 1990s he served on the editorial staffs of Lingua Franca and The New York Review of Books. He also edited \"A Bolt from the Blue and Other Essays,\" a collection by Mary McCarthy, which was published by The New York Review of Books in 2002. \n\nMr. Scott was a finalist for the Pulitzer Prize in Criticism in 2010, the same year he served as co-host (with Michael Phillips of the Chicago Tribune) on the last season of \"At the Movies,\" the syndicated film-reviewing program started by Roger Ebert and Gene Siskel.\n\nA frequent presence on radio and television, Mr. Scott is Distinguished Professor of Film Criticism at Wesleyan University and the author of Better Living Through Criticism, forthcoming in 2016 from The Penguin Press. A collection of his film writing will be published by Penguin in 2017. \n\nHe lives in Brooklyn with his family.", multimedia: multimedia)
        
        CriticBio(criticData: criticData)
    }
}
