//
//  SubirReceta.swift
//  coreML-nanostarter
//
//  Created by Alumno on 19/10/23.
//

import SwiftUI

struct SubirRecetaView: View {
    var body: some View {
            VStack{
                
                Image(systemName: "plus")
                    .font(.system(size:70))
                    .foregroundColor(Color.white)
                
                Text("Subir Recetas")
                    .font(.system(size:35))
                    .foregroundColor(Color.white)
                    .padding(.top,5)

            }
            .ignoresSafeArea()
            .padding()
            .background(Color(.init(srgbRed: 130 / 255, green: 232 / 255, blue: 90 / 255, alpha: 0.75)))
            .cornerRadius(25)
            .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 10)
        
    }
}

struct SubirRecetaView_Previews: PreviewProvider {
    static var previews: some View {
        SubirRecetaView()
    }
}
