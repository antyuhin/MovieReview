//
//  CriticRow.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 02.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct CriticRow: View, Identifiable {
    var id = UUID()
    var criticData: CriticData
    
    @State private var showCriticsData = false
    let imageURL = "http://static01.nyt.com/images/2015/10/07/topics/ao-scott/ao-scott-articleInline.jpg"
    
    var body: some View {
        NavigationLink(
            destination: CriticBio(criticData: criticData),
            isActive: $showCriticsData,
            label: {
                Button(action: {
                    self.showCriticsData.toggle()
                }, label: {
                    VStack {
                        Image("Image")
                            .resizable()
                            .frame(width: 180, height: 180)
                            .cornerRadius(20)
                        Text(criticData.display_name)
                            .font(.title2)
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                })
            })
        //            WebImage(url: URL(string: (criticData.multimedia?.resource.src)!))
    }
}


struct CriticRow_Preview: PreviewProvider {
    static var previews: some View {
        let resource = Resource(type: "", src: "http://static01.nyt.com/images/2015/10/07/topics/ao-scott/ao-scott-articleInline.jpg", height: 163, width: 220)
        let multimedia = Multimedia(resource: resource)
        let criticData = CriticData(display_name: "A. O. Scott", sort_name: "", status: "full-time", bio: "A. O. Scott joined The New York Times as a film critic in January 2000, and was named a chief critic in 2004. Previously, Mr. Scott had been the lead Sunday book reviewer for Newsday and a frequent contributor to Slate, The New York Review of Books, and many other publications. \n<br/><br/>\nIn the 1990s he served on the editorial staffs of Lingua Franca and The New York Review of Books. He also edited \"A Bolt from the Blue and Other Essays,\" a collection by Mary McCarthy, which was published by The New York Review of Books in 2002. \n<br/><br/>\nMr. Scott was a finalist for the Pulitzer Prize in Criticism in 2010, the same year he served as co-host (with Michael Phillips of the Chicago Tribune) on the last season of \"At the Movies,\" the syndicated film-reviewing program started by Roger Ebert and Gene Siskel.\n<br/><br/>\nA frequent presence on radio and television, Mr. Scott is Distinguished Professor of Film Criticism at Wesleyan University and the author of Better Living Through Criticism, forthcoming in 2016 from The Penguin Press. A collection of his film writing will be published by Penguin in 2017. \n<br/><br/>\nHe lives in Brooklyn with his family.", multimedia: multimedia)
        
        CriticRow(criticData: criticData)
    }
}
