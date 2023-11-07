//
//  NutritionInfo.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 30/10/23.
//

import SwiftUI

struct NutritionInfo: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
                        VStack{
                            Image("calorias") //calorias
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(alignment:
                                        .topLeading, content: {
                                            Text("CALORIAS")
                                                .padding()
                                        }
                                )
                        }
                    }
                }
                ZStack{
                    NavigationLink(destination: CarbsView()){
                        VStack{
                            Image("carbs") //carbohidratos
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(alignment:
                                        .topLeading, content: {
                                            Text("CARBOHIDRATOS")
                                                .padding()
                                        }
                                )
                        }
                    }
                }
            }
            .padding(10)
            HStack
            {
                ZStack{
                    NavigationLink(destination: ProteinasView()){
                        VStack{
                            Image("proteinas") //proteinas
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(alignment:
                                        .topLeading, content: {
                                            Text("PROTEINAS")
                                                .padding()
                                        }
                                )
                        }
                    }
                }
                ZStack{
                    NavigationLink(destination: GrasasView()){
                        VStack {
                            Image("grasas") //grasas
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .overlay(alignment:
                                        .topLeading, content: {
                                            Text("PROTEINAS")
                                                .padding()
                                        }
                                )
                        }
                    }
                }
            }
            .padding(10)
        }
    }
}

#Preview {
    NutritionInfo()
}
