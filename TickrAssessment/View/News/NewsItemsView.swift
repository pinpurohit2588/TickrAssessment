//
//  NewsItemsView.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import SwiftUI

struct NewsItemsView: View {
    
    @ObservedObject var viewModel: NewsViewModel
    
    var body: some View {
        if let results = viewModel.searchResult?.response.results {
            List(results) { result in
                NewsItem(result: result)
                    .onNavigation { viewModel.open(result) }
            } .navigationBarTitle("News")
        } else {
            Text("Loading...")
                .onAppear {
                    self.viewModel.fetchNewsArticles()
                }
        }
    }
}
