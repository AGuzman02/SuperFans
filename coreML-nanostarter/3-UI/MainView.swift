//
//  MainView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var recetaVM = RecetasViewModel()
    
    var body: some View {
        TabView{
            ClassificationView().environmentObject(PredictionStatus())
                .tabItem{
                    Image(systemName: "house.fill")
                }
            SearchView()
                .environmentObject(recetaVM)
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
            RecetasView()
                .environmentObject(recetaVM)
                .tabItem {
                    Image(systemName: "list.bullet.clipboard.fill")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .accentColor(Color.green)
        .navigationBarHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewDevice("iPhone 14 Pro Max")
        
        MainView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
