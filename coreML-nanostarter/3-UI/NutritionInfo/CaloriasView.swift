//
//  CaloriasView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 02/11/23.
//

import SwiftUI

struct CaloriasView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // ... (código anterior)
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green) // o cualquier otro color que prefieras
                        .cornerRadius(10) // ajusta el valor según tus necesidades
                    
                    Text("¿Qué Son Las Calorias?")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical, 5)
                }
                
                Text("Las calorías son una medida de la energía que se obtiene de los alimentos. Son esenciales para el funcionamiento adecuado del cuerpo y se pueden encontrar en diferentes tipos de alimentos, como carbohidratos, proteínas y grasas.")
                    .multilineTextAlignment(.leading)
                
                Divider()
                
                VStack{
                    
                    Text("Consumo Diario Recomendado")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                            
                        Text("El consumo diario recomendado de calorías puede variar según la edad, el sexo, el nivel de actividad física y otros factores. Es importante mantener un equilibrio adecuado para garantizar un estilo de vida saludable.")
                            .multilineTextAlignment(.leading)
                        
                        Image("calorias") // Reemplaza "calories_image" con el nombre real de tu imagen en los assets
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 120, height: 120)
                    }
                }
                Divider()
                Text("¿Cuántas Calorias Necesitas?")
                    .font(.title)
                    .fontWeight(.bold)
                Text("Tu consumo de calorias depende de:")
                VStack{
                    HStack (alignment: .center) {
                        
                        Spacer()

                        ZStack {
                            Rectangle()
                                .fill(Color.green.opacity(0.9))
                                .frame(width: 65, height: 65)
                                .cornerRadius(5)
                            Text("Edad")
                                .foregroundColor(.white)
                        }
                        
                        Spacer()

                        ZStack {
                            Rectangle()
                                .fill(Color.green.opacity(0.9))
                                .frame(width: 65, height: 65)
                                .cornerRadius(5)
                            Text("Genero")
                                .foregroundColor(.white)
                        }
                        
                        Spacer()

                        ZStack {
                            Rectangle()
                                .fill(Color.green.opacity(0.9))
                                .frame(width: 65, height: 65)
                                .cornerRadius(5)
                            Text("Altura")
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.green.opacity(0.9))
                                .frame(width: 65, height: 65)
                                .cornerRadius(5)
                            Text("Peso")
                                .foregroundColor(.white)
                        }
                        
                        Spacer()

                    }
                    
                    
                    
                    HStack (alignment: .center) {
                        
                        ZStack {
                            Rectangle()
                                .fill(Color.green.opacity(0.9))
                                .frame(width: 150, height: 65)
                                .cornerRadius(5)
                            Text("Actividad Fisica")
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .lineLimit(nil)
                        }
                        

                    }
                    
                }
            }
            .multilineTextAlignment(.center)
            .padding(.horizontal)
        }
    }
}

struct CaloriasView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriasView()
    }
}
