//
//  IngredientesDetailView.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 17/10/23.
//

import SwiftUI

struct IngredientesDetailView: View {
    
    @StateObject var ingredientesVM = IngredientesViewModel()
    @EnvironmentObject var recetaViewModel : RecetasViewModel

    let receta : RecetasModel
    
    var body: some View {
        VStack{
            
            HStack{
                
                Spacer()
                
                Text(receta.title)
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: receta.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.green)
                    .font(.system(size:25))
                    .onTapGesture {
                        recetaViewModel.arrRecetas[recetaViewModel.arrRecetas.firstIndex(of: receta) ?? 0].isFavorite.toggle()
                    }
                
                Spacer()
                
            }.padding(.top)
            
            AsyncImage(url: URL(string: "\(receta.nomimg)")){
                    phase in if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Text("No imagen").foregroundColor(.black)
                    }
                    
            }.padding(.bottom)
                
            Text("Ingredientes")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Divider()
            
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
}

    struct IngredientesDetailView_Previews: PreviewProvider {
        static var previews: some View {
        
            IngredientesDetailView(receta: RecetasModel.defaultReceta)
            
            IngredientesDetailView(receta: RecetasModel.defaultReceta)
                .previewDevice("iPhone SE (3rd generation)")
                
        }
    }
