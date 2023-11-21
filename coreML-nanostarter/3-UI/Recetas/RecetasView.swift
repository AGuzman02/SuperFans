//
//  SearchView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct RecetasView: View {
    
    @EnvironmentObject var recetaVM : RecetasViewModel
    @State var nameSearch : String = ""
    
    var filteredMeals: [RecetasModel] {
            guard !nameSearch.isEmpty else { return recetaVM.arrRecetaFav }
            return recetaVM.arrRecetaFav.filter { receta in
                receta.recetaname!.lowercased().contains(nameSearch.lowercased())
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
                    .navigationTitle("Favoritas")
                    .searchable(text: $nameSearch, prompt: "Busca Recetas")
                    .task{
                        do{
                            try await recetaVM.getRecetasID()
                        } catch {
                            print("Error getting")
                        }
                    }
                    
            }
        }
    }
}

struct RecetasView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone 14 Pro Max")
        
        SearchView()
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone SE (3rd generation)")
    }
}

