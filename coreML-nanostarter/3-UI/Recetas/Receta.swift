//
//  Receta.swift
//  coreML-nanostarter
//
//  Created by Alumno on 13/10/23.
//

import SwiftUI

struct Receta: View {
    
    let receta : RecetasModel
    
    var body: some View {
        
        let screen = UIScreen.main.bounds
            
        NavigationLink(destination: IngredientesDetailView(receta: receta)){
            ZStack {
                Color(.init(srgbRed: 130 / 255, green: 232 / 255, blue: 90 / 255, alpha: 0.75))
                .frame(width: screen.width - screen.width * 0.05, height: screen.height - screen.height * 0.79)
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 5)
                HStack(){
                    Image(receta.nomimg)
                        .resizable()
                        .scaledToFit()
                    .frame(width: screen.width * 0.45)
                        .cornerRadius(25)
                        .frame(maxHeight: 150)
                        .padding(.leading,6)
                        .shadow(radius: 5, x: 0, y: 5)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing){
                        Text(receta.title)
                            .padding(.vertical, 4)
                            .foregroundColor(Color.black)
                        
                        Text(receta.description)
                            .font(.system(size: 20, weight: .ultraLight))
                            .foregroundColor(Color.black)
                        
                    }
                    .padding(.trailing,8)
                }
                .padding(.horizontal)
            }
            
        }
        //NavigationLink(destination: IngredientesDetailView()){
        //let screen = UIScreen.main.bounds
  
    }
    //}
}

struct Receta_Previews: PreviewProvider {
    static var previews: some View {
        Receta(receta: RecetasModel.defaultReceta)
            .previewDevice("iPhone 14 Pro Max")
            .preferredColorScheme(.dark)
        
        
        
        Receta(receta: RecetasModel.defaultReceta)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
