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
            VStack(alignment: .leading, spacing: 20) {
                // ... (código anterior)
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.green) // o cualquier otro color que prefieras
                        .cornerRadius(10) // ajusta el valor según tus necesidades

                    Text("¿Qué son las calorias?")
                        .font(.title)
                        .fontWeight(.bold)
                        .fixedSize(horizontal: false, vertical: true)
                }
                            Text("Las calorías son una medida de la energía que se obtiene de los alimentos. Son esenciales para el funcionamiento adecuado del cuerpo y se pueden encontrar en diferentes tipos de alimentos, como carbohidratos, proteínas y grasas.")

                            Divider()

                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Consumo diario recomendado")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("El consumo diario recomendado de calorías puede variar según la edad, el sexo, el nivel de actividad física y otros factores. Es importante mantener un equilibrio adecuado para garantizar un estilo de vida saludable.")
                    }

                    Spacer()

                    Image("calorias") // Reemplaza "calories_image" con el nombre real de tu imagen en los assets
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                }
                Divider()
                Text("¿Cuantas calorias necesitas?")
                    .font(.title)
                    .fontWeight(.bold)
                Text("El consumo de calorias depende de ...")
                HStack (alignment: .center, spacing: 20) {
                    ZStack {
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 100, height: 100)
                        Text("Edad")
                            .foregroundColor(.white)
                    }

                    ZStack {
                        Rectangle()
                            .fill(Color.orange)
                            .frame(width: 100, height: 100)
                        Text("Genero")
                            .foregroundColor(.white)
                    }

                    ZStack {
                        Rectangle()
                            .fill(Color.yellow)
                            .frame(width: 100, height: 100)
                        Text("Altura")
                            .foregroundColor(.white)
                    }
                }
                HStack (alignment: .center, spacing: 20) {
                    ZStack {
                        Rectangle()
                            .fill(Color.green)
                            .frame(width: 100, height: 100)
                        Text("Peso")
                            .foregroundColor(.white)
                    }

                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 100, height: 100)
                        Text("Pubertad")
                            .foregroundColor(.white)
                    }

                    ZStack {
                        Rectangle()
                            .fill(Color.purple)
                            .frame(width: 100, height: 100)
                        Text("Actividad Fisica")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                                    .lineLimit(nil)
                    }
                }
            }
            .padding()

        }
    }
}

struct CaloriasView_Previews: PreviewProvider {
    static var previews: some View {
        CaloriasView()
    }
}
