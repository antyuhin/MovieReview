//
//  ReviewRow.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 02.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ReviewRow: View, Identifiable {
    var id = UUID()
    var reviewData: ReviewData
    
    @State private var showWebView = false
    
    var body: some View {
        VStack {
            WebImage(url: URL(string: reviewData.multimedia.src))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 380)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text(reviewData.headline)
                .font(.title)
                .fontWeight(.semibold)
                .frame(width: 380, alignment: .leading)
            Text(reviewData.summary_short)
                .frame(width: 380)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                .lineLimit(3)
            HStack {
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.orange)
                    Text(reviewData.byline)
                        .foregroundColor(.orange)
                }
                .padding()
                Spacer()
                
                Text(reviewData.publication_date)
                    .font(.callout)
                    .foregroundColor(.gray)
                    .padding()
                
            }
            Button(
                action: {
                    self.showWebView.toggle()
                },
                label: {
                    Text("Read Review")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: 380, height: 40)
                        .foregroundColor(.orange)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/))
                    
                })
                .sheet(isPresented: $showWebView, content: {
                    WebView(url: URL(string: reviewData.link.url))
                })
                .padding(.bottom, 40)
            
        }
    }
}

struct ReviewRow_Preview: PreviewProvider {
    static var previews: some View {
        let link = Link(type: "", url: "https://www.nytimes.com/2021/09/23/movies/im-your-man-review.html")
        let multimedia = MultimediaReview(src: "https://static01.nyt.com/images/2021/09/21/arts/imyourman1/imyourman1-mediumThreeByTwo440.jpg", height: 140, width: 210)
        let reviewData = ReviewData(display_title: "I'm Your Man", byline: "Jeannette Catsoulis", headline: "‘I’m Your Man’ Review: Living Doll", summary_short: "Dan Stevens plays a dreamy, pleasure-driven android in this delightful near-future romance.", publication_date: "2021-09-23", link: link, multimedia: multimedia)
        ReviewRow(reviewData: reviewData)
    }
}
