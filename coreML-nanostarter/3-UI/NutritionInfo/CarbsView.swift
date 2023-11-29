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
            VStack(spacing: 20) {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green) // o cualquier otro color que prefieras
                        .cornerRadius(10) // ajusta el valor según tus necesidades
                    
                    Text("¿Qué Son Los Carbohidratos?")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.center)
                        .padding(.vertical, 5)
                }
                .padding()
                HStack {
                    Text("Los carbohidratos son una de las tres principales clases de macronutrientes que proporcionan energía al cuerpo. Se encuentran en alimentos como pan, arroz, pasta, frutas y verduras. El cuerpo descompone los carbohidratos en glucosa, que se utiliza como fuente de energía para las funciones diarias y actividades físicas.")
                    
                    Image("los-carbs")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
                Divider()
                Text("Se Dividen En:")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)

                HStack(alignment: .top, spacing: 10) {
                    VStack(spacing: 10) {
                        Text("Simples")
                            .font(.title2)
                            .foregroundColor(.green.opacity(0.8))
                            .fontWeight(.heavy)
                            
                        Text("Conocidos como azúcares simples. Se absorben rápidamente en el cuerpo y proporcionan una fuente de energía rápida. Ejemplos incluyen la fructosa en las frutas y la sacarosa en el azúcar de mesa.")
                    }
                    
                    Divider()
                            
                    VStack(spacing: 10) {
                        Text("Compuestos")
                            .font(.title2)
                            .foregroundColor(.green.opacity(0.8))
                            .fontWeight(.heavy)
                                                        
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
