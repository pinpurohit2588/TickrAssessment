//
//  NewsViewModel.swift
//  TickrAssessment
//
//  Created by Pinakin Purohit on 28/06/2021.
//

import Foundation
import Combine

protocol NewsViewModelProtocal {
    func fetchNewsArticles()
}

class NewsViewModel: NewsViewModelProtocal, ObservableObject {
    
    private let modelManager: ModelManagerProtocol
    private var cancellables: Set<AnyCancellable> = []
    
    private unowned let coordinator: CoordinatorObject
    
    @Published private(set) var searchResult: SearchResult?
    
    init(modelManager: ModelManagerProtocol, coordinator: CoordinatorObject) {
        self.modelManager = modelManager
        self.coordinator = coordinator
    }

    func fetchNewsArticles() {
        modelManager.modelPublisher()
          .sink(receiveCompletion: { completion in
            //
          },
          receiveValue: { [weak self] model in
            DispatchQueue.main.async {
                self?.searchResult = model
            }
          })
          .store(in: &cancellables)
    }
    
     func open(_ result: Result) {
           coordinator.open(result)
     }
    
    deinit {
      cancellables.forEach {
        $0.cancel()
      }
    }
}

