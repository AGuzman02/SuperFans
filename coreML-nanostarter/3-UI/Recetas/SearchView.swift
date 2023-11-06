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
    
    var filteredMeals: [RecetasModel] {
            guard !nameSearch.isEmpty else { return recetaViewModel.arrRecetas }
            return recetaViewModel.arrRecetas.filter { receta in
                receta.title.lowercased().contains(nameSearch.lowercased())
            }
        }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    ForEach(filteredMeals, id: \.self){
                        item in
                        Receta(receta: item)
                    }
        
                }
                .navigationTitle("Recetas")
                .searchable(text: $nameSearch, prompt: "Busca Recetas")
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
