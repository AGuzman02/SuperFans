//
//  IngredientesDetailView.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 17/10/23.
//

import SwiftUI

struct IngredientesDetailView: View {
    
    @StateObject var ingredientesVM2 = Ingredientes2ViewModel()
    @StateObject var pasosVM = PasosViewModel()


    let receta : RecetasModel
    
    var body: some View {
        VStack{
            
            HStack{
                
                Spacer()
                
                Text(receta.recetaname ?? "")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                /*
                Image(systemName: receta.isFavorite ? "star.fill" : "star")
                    .foregroundColor(.green)
                    .font(.system(size:25))
                    .onTapGesture {
                        recetaViewModel.arrReceta[recetaViewModel.arrReceta.firstIndex(of: receta) ?? 0].isFavorite.toggle()
                    }
                */
                
                Spacer()
                
            }.padding(.top)
            
            AsyncImage(url: URL(string: "\(String(describing: receta.img))")){
                    phase in if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Text("No hay imagen").foregroundColor(.black)
                    }
                    
            }.padding(.bottom)
                
            Text("Ingredientes")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Divider()
            
            List {
                ForEach(ingredientesVM2.arrIngredientes2, id: \.ingrediente) { item in
                    Text(item.ingrediente)
                        .font(.headline)
                        .padding(.bottom, 5)
                }
                .padding(.horizontal, 20)
            }
            .listStyle(PlainListStyle())
            .task {
                do {
                    try await ingredientesVM2.getIngredientesData2()
                } catch {
                    print("Error: \(error)")
                }
            }
            //PASOS
            Text("Pasos")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Divider()
            
            List {
                ForEach(pasosVM.arrPasos, id: \.instruccion) { item in
                    Text(item.instruccion ?? "")
                        .font(.headline)
                        .padding(.bottom, 5)
                }
                .padding(.horizontal, 20)
            }
            .listStyle(PlainListStyle())
            .task {
                do {
                    try await pasosVM.getPasos()
                    print("Si lo llamo")
                } catch {
                    print("Error: \(error)")
                }
            }
        }
        
    }
}

    struct IngredientesDetailView_Previews: PreviewProvider {
        static var previews: some View {
        
            IngredientesDetailView(receta: RecetasModel(recetaname: "Buffalo Chicken Tacos", tiempo: 15, img: "tacos.jpg"))
                .environmentObject(RecetasViewModel())
            
            IngredientesDetailView(receta: RecetasModel(recetaname: "Buffalo Chicken Tacos", tiempo: 15, img: "tacos.jpg"))
                .environmentObject(RecetasViewModel())
                .previewDevice("iPhone SE (3rd generation)")
                
        }
    }
