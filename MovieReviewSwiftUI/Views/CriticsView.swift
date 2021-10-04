//
//  CriticsView.swift
//  MovieReviewSwiftUI
//
//  Created by Andrew Ant on 30.09.2021.
//

import SwiftUI

struct CriticsView: View {
    @ObservedObject var searchText = Search()
    
    @State var critics: [CriticData] = []
    let criticsURL: String
    
    var body: some View {
        NavigationView {
            VStack() {
                SearchBar(search: searchText)
                
                Spacer()
                ScrollView (showsIndicators: false) {
                    ForEach(critics.filter({
                        searchText.text.isEmpty ? true : $0.display_name.contains(searchText.text)
                    }), id:\.self) { critic in
                        CriticRow(criticData: critic)
                            .padding()
                    }
                    .padding(.leading, 70)
                    .padding(.trailing, 70)
                }.onAppear() {
                    let api = Api(criticsResponse: critics, urlString: criticsURL)
                    api.getCritics() { (critics) in
                        self.critics = critics
                    }
                }
            }
            .padding()
            .navigationTitle("Critics")
        }
    }
}


struct CriticsView_Preview: PreviewProvider {
    static var previews: some View {
        CriticsView(criticsURL: "")
    }
}
