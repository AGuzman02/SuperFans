//
//  Receta.swift
//  coreML-nanostarter
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct Receta: View {
    
    let receta: RecetasModel
    @EnvironmentObject var recetaVM : RecetasViewModel
    @EnvironmentObject var ingredientesVM2 : Ingredientes2ViewModel 
    @EnvironmentObject var cartVM : cartViewModel

    var body: some View {
        
        let screen = UIScreen.main.bounds
        
        NavigationLink(destination: IngredientesDetailView(receta: receta)){
            ZStack {
                Color(.init(srgbRed: 130 / 255, green: 232 / 255, blue: 90 / 255, alpha: 0.75))
                    .frame(width: screen.width - screen.width * 0.05, height: screen.height - screen.height * 0.79)
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                
                HStack{
                    AsyncImage(url: URL(string: "https://api-superfans.onrender.com/users/imagen/\(String(describing: receta.img))" )){
                        phase in if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: screen.width * 0.45)
                                .cornerRadius(25)
                                .frame(maxHeight: 150)
                                .padding(.leading, 6)
                                .shadow(radius: 5, x: 0, y: 5)
                        } else if phase.error != nil {
                            Text("No imagen").foregroundColor(.black)
                        }
                    }
                    
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text(receta.recetaname ?? "No hay nombre BDD")
                            .padding(.vertical, 4)
                        
                        //Text(receta.calories ?? 0).padding(.bottom,5)
                        
                        HStack {
                            Text("\(receta.tiempo ?? -1) min  ")
                                .font(.system(size: 20, weight: .light))
                            
                            Image(systemName: "deskclock")
                        }
                        Button(action: {
                            Task {
                                do {
                                    if recetaVM.isFavorite(receta: receta) {
                                        try await recetaVM.deleteRecetaFav(idPerfil: 22, idReceta: receta.idreceta ?? 0)
                                    } else {
                                        try await recetaVM.addRecetaFav(idPerfil: 22, idReceta: receta.idreceta ?? 0)
                                    }
                                }
                                catch {
                                    print("Post fav error: \(error)")
                                }
                                
                            }
                        }) {
                            Image(systemName: recetaVM.isFavorite(receta: receta) ? "star.fill" : "star")
                            //Image(systemName: cartVM.isFavorite2(receta: receta) ? "star.fill" : "star")
                            
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.yellow)
                        }
                        
                        
                    }
                    .foregroundColor(.black)
                    .padding(.trailing, 8)
                }
            }
            .padding(.horizontal)
        }
        
    }
}


struct Receta_Previews: PreviewProvider {
    static var previews: some View {
        Receta(receta: RecetasModel(recetaname: "Buffalo Chicken Tacos", tiempo: 15, img: "tacos.jpg"))
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone 14 Pro Max")
            .preferredColorScheme(.dark)
        
        
        
        Receta(receta: RecetasModel(recetaname: "Buffalo Chicken Tacos", tiempo: 15, img: "tacos.jpg"))
            .environmentObject(RecetasViewModel())
            .previewDevice("iPhone SE (3rd generation)")
    }
}
