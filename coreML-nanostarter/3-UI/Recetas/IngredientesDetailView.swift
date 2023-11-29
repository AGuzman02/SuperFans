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
    //@State private var idreceta= receta.idreceta


    let receta : RecetasModel
    
    var body: some View {
        ScrollView{
            VStack{
                
                HStack{
                    
                    Spacer()
                    
                    Text(receta.recetaname ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    //Spacer()
                    
                     /*Image(systemName: receta.isFavorite ? "star.fill" : "star")
                     .foregroundColor(.green)
                     .font(.system(size:25))
                     .onTapGesture {
                     recetaViewModel.arrReceta[recetaViewModel.arrReceta.firstIndex(of: receta) ?? 0].isFavorite.toggle()
                     }*/
                    
                     
                    
                    Spacer()
                    
                }.padding(.top)
                
                AsyncImage(url: URL(string: "https://api-superfans.onrender.com/users/imagen/\(String(describing: receta.img))" )){
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
                
                Divider()
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green) // o cualquier otro color que prefieras
                        .cornerRadius(10) // ajusta el valor según tus necesidades
                        .padding(.horizontal,20)

                    Text("INGREDIENTES")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                /*List (ingredientesVM2.arrIngredientes2, id: \.ingrediente) { item in
                 //ForEach(ingredientesVM2.arrIngredientes2, id: \.ingrediente) { item in
                 Text(item.ingrediente)
                 .font(.headline)
                 .padding(.bottom, 5)
                 //}
                 //.padding(.horizontal, 20)
                 }.padding(.horizontal, 20)
                 .listStyle(PlainListStyle())
                 .frame(minHeight: 0, maxHeight: .infinity)*/
                
                //ScrollView {
                VStack {
                    ForEach(ingredientesVM2.arrIngredientes2, id: \.ingrediente) { item in
                        Text(item.ingrediente)
                            .font(.headline)
                            .padding(.bottom, 5)
                    }
                }
                
                .padding(.horizontal, 20)
                
                
                .task {
                    do {
                        try await ingredientesVM2.getIngredientesData2(idreceta: receta.idreceta ?? 0)
                    } catch {
                        print("Error: \(error)")
                    }
                }
                //PASOS
                Divider()
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green) // o cualquier otro color que prefieras
                        .cornerRadius(10) // ajusta el valor según tus necesidades
                        .padding(.horizontal,20)

                    Text("PASOS")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                }
                
                
                
                /*List {
                    ForEach(pasosVM.arrPasos, id: \.instruccion) { item in
                        Text(item.instruccion ?? "")
                            .font(.headline)
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal, 20)
                }
                .listStyle(PlainListStyle())*/
                
                VStack {
                    ForEach(pasosVM.arrPasos, id: \.instruccion) { item in
                        Text(item.instruccion ?? "")
                            .font(.headline)
                            .padding(.bottom, 5)
                    }
                }.padding(.horizontal,20)
                .task {
                    do {
                        try await pasosVM.getPasos(idreceta: receta.idreceta ?? 0)
                        print("Si lo llamo")
                    } catch {
                        print("Error: \(error)")
                    }
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
