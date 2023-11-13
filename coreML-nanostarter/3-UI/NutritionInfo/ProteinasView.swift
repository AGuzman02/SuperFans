//
//  ProteinasView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 02/11/23.
//

import SwiftUI

struct ProteinasView: View {
    var body: some View {
        let foods = ["Carne", "Pescado", "Huevos", "Leche", "Soja", "Legumbres", "Cereales"]
        let imageNames = ["carne", "pescado", "huevo", "leche", "calorias","calorias", "calorias"]

        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green)
                        .cornerRadius(10)

                    Text("¿Qué son las proteínas?")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()

                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Las proteínas son nutrientes esenciales que desempeñan un papel vital en el desarrollo, crecimiento y reparación de tejidos en el cuerpo. Son fundamentales para la estructura y función de las células y son componentes clave de hormonas, enzimas y otros químicos del cuerpo.")
                    }

                    Spacer()

                    Image("las-proteinas")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }

                Divider()
                Text("Funciones principales de las proteínas:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                Text("1. Construcción y reparación de tejidos.")
                Text("2. Funciones enzimáticas y hormonales.")
                Text("3. Transporte y almacenamiento de moléculas.")
                Text("4. Regulación del equilibrio ácido-base y el transporte de oxígeno.")
                Text("5. Participación en el sistema inmunológico.")
                Divider()
                
                /*
                Text("Alimentos ricos en proteínas:")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)

                
                Text("Alimentos ricos en proteínas:")
                    .font(.title)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(0..<foods.count, id: \.self) { index in
                            VStack {
                                Image(imageNames[index])
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(10)
                                Text(foods[index])
                            }
                        }
                    }
                }
                 */
                 
                 

            }
            .padding()
        }
    }
}

struct ProteinasView_Previews: PreviewProvider {
    static var previews: some View {
        ProteinasView()
    }
}
