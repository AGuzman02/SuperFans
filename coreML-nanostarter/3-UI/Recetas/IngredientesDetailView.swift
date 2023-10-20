//
//  IngredientesDetailView.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 17/10/23.
//

import SwiftUI

struct IngredientesDetailView: View {
    //@StateObject var IngredientesVM = IngredientesViewModel()
    
    @StateObject var ingredientesVM = IngredientesViewModel()
    
    
    var body: some View {
        Image("carbonara")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .cornerRadius(10)
            //.padding(.vertical, 20)
            //.aspectRatio(contentMode: .fit)
        Text("Ingredientes")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.green)
            .padding(.bottom, 10)

        List {
            ForEach(ingredientesVM.arrIngredientes) { item in
                Text(item.ingrediente)
                    .font(.headline)
                    .padding(.bottom, 5)
            }
            .padding(.horizontal, 20)
        }
        .listStyle(PlainListStyle()) // Cambia el estilo de la lista a PlainListStyle
        .task {
            do {
                try await ingredientesVM.getIngredientesData()
            }
            catch {
                print("error")
            }
        }
        
    }
}

    struct IngredientesDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let item = IngredientesModel(ingredienteid: 1, ingrediente: "Ejemplo")
        }
    }
