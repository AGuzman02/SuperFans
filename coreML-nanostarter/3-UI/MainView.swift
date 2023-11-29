//
//  MainView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var cartVM = cartViewModel()
    @StateObject var recetaVM = RecetasViewModel()
    
    var body: some View {
        TabView{
            ClassificationView()
                .environmentObject(cartVM)
                .tabItem{
                    Image(systemName: "house.fill")
                }
            SearchView()
                .environmentObject(cartVM)
                .environmentObject(recetaVM)                
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
            
            NutritionInfo()
                .tabItem{
                    Image(systemName: "questionmark")
                }
            
            RecetasView()
                .environmentObject(recetaVM)
                .tabItem {
                    Image(systemName: "star.fill")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        
        MainView()
            .environmentObject(cartViewModel())
            .environmentObject(RecetasViewModel())
            .environmentObject(PredictionStatus())
            .previewDevice("iPhone 14 Pro Max")
        
        MainView()
            .previewDevice("iPhone 14 Pro Max")
            .preferredColorScheme(.dark)
            
        
        MainView()
            .previewDevice("iPhone SE (3rd generation)")
        
        MainView()
            .previewDevice("iPhone SE (3rd generation)")
            .preferredColorScheme(.dark)
    }
}
