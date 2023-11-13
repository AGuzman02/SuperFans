//
//  CarbsView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 02/11/23.
//

import SwiftUI

struct CarbsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green) // o cualquier otro color que prefieras
                        .cornerRadius(10) // ajusta el valor según tus necesidades
                    
                    Text("¿Qué son los carbohidratos?")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding()
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Los carbohidratos son una de las tres principales clases de macronutrientes que proporcionan energía al cuerpo. Se encuentran en alimentos como pan, arroz, pasta, frutas y verduras. El cuerpo descompone los carbohidratos en glucosa, que se utiliza como fuente de energía para las funciones diarias y actividades físicas.")
                    }

                    Spacer()

                    Image("los-carbs")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
                Divider()
                Text("Se dividen en: ")
                    .font(.title)
                    .fontWeight(.bold)
                HStack(alignment: .center, spacing: 20) {
                            VStack(alignment: .center, spacing: 10) {
                                Text("Simples")
                                    .font(.title)
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                
                                Text("Conocidos como azúcares simples. Se absorben rápidamente en el cuerpo y proporcionan una fuente de energía rápida. Ejemplos incluyen la fructosa en las frutas y la sacarosa en el azúcar de mesa.")
                            }
                            
                            VStack(alignment: .center, spacing: 10) {
                                Text("Compuestos")
                                    .font(.title)
                                    .foregroundColor(.purple)
                                    .fontWeight(.bold)
                                
                                Text("Estos se descomponen más lentamente en el cuerpo, proporcionando una liberación de energía sostenida. Fuentes de carbohidratos compuestos incluyen granos enteros, legumbres y vegetales.")
                            }
                        }
            }
            .padding()
        }
    }
}

struct CarbsView_Previews: PreviewProvider {
    static var previews: some View {
        CarbsView()
    }
}
