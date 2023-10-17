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
        
        ZStack {
            Color.white
                .frame(width: screen.width - screen.width * 0.05, height: screen.height - screen.height * 0.79)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 5)
            HStack(){
                Image(receta.nomimg)
                    .resizable()
                    .scaledToFit()
                    .frame(width: screen.width * 0.45)
                    .cornerRadius(25)
                    .padding(.leading,6)
                    .shadow(radius: 5, x: 0, y: 5)
                Spacer()
                VStack (alignment: .trailing){
                    Text(receta.title)
                        .padding(.vertical, 4)
                        
                    Text(receta.description)
                        .font(.system(size: 20, weight: .ultraLight))
                    
                }
                .padding(.trailing,8)
            }
            .padding()
        }
    }
}

struct Receta_Previews: PreviewProvider {
    static var previews: some View {
        Receta(receta: RecetasModel.defaultReceta)
            .previewDevice("iPhone 14 Pro Max")
        Receta(receta: RecetasModel.defaultReceta)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
