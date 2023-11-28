//
//  ContentView.swift
//  coreML-starter
//
//  
//

import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject var ingredientesVM2 = Ingredientes2ViewModel()
   
    
    var body: some View {
        NavigationView {
            LaunchScreenView()
                .environmentObject(PredictionStatus())               
                
        }
        .navigationViewStyle(.stack)

    }// body
}// View
