//
//  SearchView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct SearchView: View {
    
    
    @EnvironmentObject var recetaViewModel : RecetasViewModel
    @State var nameSearch : String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search", text: $nameSearch)
                        Spacer()
                        NavigationLink(destination: NutritionInfo()){
                            Image(systemName: "questionmark.circle")
                                .padding(.trailing, 10)
                        }
                    }.padding(.leading)
                    .padding(.bottom)
                
                    ForEach(recetaViewModel.arrRecetas, id: \.self){
                        item in
                        Receta(receta: item)
                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone 14 Pro Max")
        
        SearchView()
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone SE (3rd generation)")
    }
}
