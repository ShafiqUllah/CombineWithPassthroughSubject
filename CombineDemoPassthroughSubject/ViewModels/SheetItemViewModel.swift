//
//  SheetItemViewModel.swift
//  CombineDemoPassthroughSubject
//
//  Created by Shafiq  Ullah on 11/23/23.
//

import Foundation
import Combine
struct SheetItemViewModel {
    
    static let action = PassthroughSubject<String, Never>()
}
