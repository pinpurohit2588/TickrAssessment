//
//  NewsDetailsViewModel.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import Foundation

class  NewsDetailsViewModel: ObservableObject, Identifiable {
   
    private unowned let coordinator: CoordinatorObject
    
    @Published private(set) var result: Result?
    
    init(result: Result, coordinator: CoordinatorObject) {
        self.result = result
        self.coordinator = coordinator
    }
}

