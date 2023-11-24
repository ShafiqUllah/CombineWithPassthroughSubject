//
//  SheetItemView.swift
//  CombineDemoPassthroughSubject
//
//  Created by Shafiq  Ullah on 11/23/23.
//

import SwiftUI
import Combine

struct SheetItemView: View {
    
    @Binding var sheetViewShowing: Bool
    let action = SheetItemViewModel.action
    
    var body: some View {
        VStack{
            Button("Send value"){
                action.send("This is PassThroughSubject")
            }
        }
    }
}

struct SheetItemView_Previews: PreviewProvider {
    static var previews: some View {
        SheetItemView(sheetViewShowing: Binding(get: {
            return true
        }, set: {_ in
            
        }))
    }
}
