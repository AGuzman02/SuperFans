//
//  GrasasView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 02/11/23.
//

import SwiftUI

struct GrasasView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green) // o cualquier otro color que prefieras
                        .cornerRadius(10) // ajusta el valor según tus necesidades
                    
                    Text("¿Qué son los lipidos?")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Los lípidos son moléculas esenciales para el cuerpo humano que desempeñan un papel crucial en el almacenamiento de energía, la estructura celular y diversas funciones biológicas. Los lípidos incluyen grasas, aceites, fosfolípidos y esteroides. Aunque a menudo se asocian con las grasas, los lípidos también son fundamentales para la absorción de vitaminas y la construcción de membranas celulares.")
                    }

                    Spacer()

                    Image("los-lipidos")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
            }
            .padding()
        }
    }
}

struct GrasasView_Previews: PreviewProvider {
    static var previews: some View {
        GrasasView()
    }
}
