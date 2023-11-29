//
//  SearchView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct SearchView: View {
    @EnvironmentObject var cartVM : cartViewModel
    @EnvironmentObject var recetaVM : RecetasViewModel
    @State var nameSearch : String = ""
    @State private var isAll = false

    var filteredMeals: [RecetasModel] {
        guard !nameSearch.isEmpty else { return cartVM.arrRecetaCarr }
        return cartVM.arrRecetaCarr.filter { receta in
                receta.recetaname!.lowercased().contains(nameSearch.lowercased())
            }
        }
    
     var allMeals: [RecetasModel] {
         guard !nameSearch.isEmpty else { return recetaVM.arrReceta }
         return recetaVM.arrReceta.filter { receta in
                 receta.recetaname!.lowercased().contains(nameSearch.lowercased())
             }
         }
    
    var body: some View {
        NavigationView {
            ScrollView {
                    VStack {
                        
                        Toggle("",isOn: $isAll).padding(.trailing)
                        
                        if isAll{
                            ForEach(filteredMeals, id: \.self){
                                item in
                                Receta(receta: item)
                            }
                        } else{
                            ForEach(allMeals, id: \.self){
                                item in
                                Receta(receta: item)
                            }
                        }

                    }
                    .navigationTitle("Recetas")
                    .searchable(text: $nameSearch, prompt: "Busca Recetas")
                    .task{
                        do{
                            try await recetaVM.getRecetas()
                             try await cartVM.sendCarrito()
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
