//
//  ContectViewViewModel.swift
//  CombineDemoPassthroughSubject
//
//  Created by Shafiq  Ullah on 11/23/23.
//

import Foundation
import Combine

class ContentViewViewModel: ObservableObject{
    @Published var listOfItems = [ListItemModel]()
    @Published var sheetViewShowing = false
    @Published var textViewString = "hi"
    
    var cancellable = Set<AnyCancellable>()
    let action = SheetItemViewModel.action
    
    init() {
        
        listOfItems.append(ListItemModel(id: UUID().uuidString, title: "a"))
        listOfItems.append(ListItemModel(id: UUID().uuidString, title: "b"))
        listOfItems.append(ListItemModel(id: UUID().uuidString, title: "c"))
        
        APICalller.shared.fetchData()
            .receive(on: DispatchQueue.main, options: .none)
            .map({ vals in
                vals.map { v  -> String in
                    if v == "e"{
                        return v
                    }else{
                        return v + " x"
                    }
                }
            })
            .sink { error in
                switch error {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Data downloaded successfully")
                }
            } receiveValue: { [weak self]values in
                guard let self = self else { return }
                values.forEach { value in
                    self.listOfItems.append(ListItemModel(id: UUID().uuidString, title: value))
                }
            }
            .store(in: &cancellable)
        
        

        action.sink { [weak self ] val in
            guard let self = self else {return}
            print("received")
            self.textViewString = val
        }.store(in: &cancellable)
    }
}
