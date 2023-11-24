//
//  APICaller.swift
//  CombineDemoPassthroughSubject
//
//  Created by Shafiq  Ullah on 11/23/23.
//

import Foundation
import Combine

class APICalller {
    static let shared = APICalller()
    
    func fetchData() -> Future<[String], Error>{
     
        return Future { promise in
            DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                promise(.success(["d", "e", "f"]))
            }
            
        }
    }
}
