//
//  SearchView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var recetaVM : RecetasViewModel
    @EnvironmentObject var cartVM : cartViewModel
    @EnvironmentObject var ingredientesVM : IngredientesViewModel
    @State var nameSearch : String = ""
    
    var filteredMeals: [RecetasModel] {
        guard !nameSearch.isEmpty else { return recetaVM.arrReceta }
            return recetaVM.arrReceta.filter { receta in
                receta.recetaname!.lowercased().contains(nameSearch.lowercased())
            }
        }
    
    var filteredMeal: [RecetasModel] {
            return recetaVM.arrReceta.filter { receta in
                return ingredientesVM.arrIngredientes.contains { ingredient in
                    cartVM.arrCart.contains(ingredient.ingrediente)
                }
            }
        }

    
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                        ForEach(cartVM.arrCart, id: \.self){
                            item in
                            Text(item)
                        }
                        
                        ForEach(filteredMeals, id: \.self){
                            item in
                            Receta(receta: item)
                        }
                        
                    }
                    .navigationTitle("Recetas")
                    .searchable(text: $nameSearch, prompt: "Busca Recetas")
                    .task{
                        do{
                            try await recetaVM.getRecetas()
                        } catch {
                            print("Error getting")
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
            .environmentObject(cartViewModel())
            .environmentObject(Ingredientes2ViewModel())
            .previewDevice("iPhone 14 Pro Max")
        
        SearchView()
            .environmentObject(RecetasViewModel())
            .environmentObject(cartViewModel())
            .environmentObject(Ingredientes2ViewModel())
            .previewDevice("iPhone SE (3rd generation)")
    }
}
