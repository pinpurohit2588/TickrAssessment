//
//  NewsDetailView.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import SwiftUI
import Kingfisher

struct NewsDetailView: View {
    
    @ObservedObject var viewModel: NewsDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                
                if let url = viewModel.result?.fields.thumbnail {
                    KFImage(URL(string: url)).resizable() // Let you resize the images
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2, alignment: .topLeading) // define frame size as required
                }
                Text(viewModel.result?.fields.headline ?? "") .padding()
                Text(viewModel.result?.fields.trailText ?? "") .padding()
                WebView(text: viewModel.result?.fields.body ?? "")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, idealHeight: 500, maxHeight: .infinity, alignment: .center)
                    .padding()
                
            }.navigationBarTitle("Details")
        }
        
    }
}

