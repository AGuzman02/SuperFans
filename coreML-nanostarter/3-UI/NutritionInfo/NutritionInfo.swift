//
//  NutritionInfo.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 30/10/23.
//

import SwiftUI

struct NutritionInfo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack
        {
            Image("platobuencomer1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.frame(width: 100, height: 100)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 7)

            HStack
            {
                ZStack{
                    NavigationLink(destination: CaloriasView()){
                        Image("calorias") //calorias
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    Text("CALORIAS")
                }
                ZStack{
                    NavigationLink(destination: CarbsView()){
                        Image("carbs") //carbohidratos
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    Text("CARBOHIDRATOS")
                }
            }
            .padding(10)
            HStack
            {
                ZStack{
                    NavigationLink(destination: ProteinasView()){
                        Image("proteinas") //proteinas
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    Text("PROTEINAS")
                }
                ZStack{
                    NavigationLink(destination: GrasasView()){
                        Image("grasas") //grasas
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                    Text("GRASAS")
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    NutritionInfo()
}
