//
//  NewsItem.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import SwiftUI
import Kingfisher

struct NewsItem: View {
    let result:Result
    var body: some View {
        HStack {
            if let url = result.fields.thumbnail {
                HStack(alignment:.top, spacing:nil, content: {
                    KFImage(URL(string:url)!).resizable() // Let you resize the images
                        .frame(minWidth: 0, maxWidth:100, minHeight: 100, idealHeight: 100, maxHeight: 100, alignment: .top) // define frame size as required
                })
            }
            VStack {
                Text(result.fields.headline).padding().lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                Text(result.fields.trailText).padding().lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)

            }
        }
    }
}

struct NewsItem_Previews: PreviewProvider {
    static var previews: some View {
        NewsItem(result: Result(id:"", type: .article, sectionID: "", sectionName:"", webPublicationDate:"", webTitle: "", webURL: "", apiURL: "", fields: Fields(headline:"", trailText:"", shortURL: "", thumbnail: "", body:""), isHosted: true))
    }
}

