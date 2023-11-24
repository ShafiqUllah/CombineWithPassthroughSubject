//
//  ContentView.swift
//  CombineDemoPassthroughSubject
//
//  Created by Shafiq  Ullah on 11/23/23.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @StateObject var vm = ContentViewViewModel()
   
    
    
    //let action = PassthroughSubject<String, Never>() // <T,T> = <Output, Failure>
    
    var body: some View {
        
        Text(vm.textViewString)
        
        Button("Sheet View"){
            vm.sheetViewShowing = true
        }
        .sheet(isPresented: $vm.sheetViewShowing) {
            SheetItemView(sheetViewShowing: $vm.sheetViewShowing)
        }

        
        List(vm.listOfItems) { item in
            Button(item.title){
               
            }
            .foregroundColor(.green)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
