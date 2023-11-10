//
//  NutritionInfo.swift
//  coreML-nanostarter
//
//  Created by Alumno on 02/11/23.
//

import SwiftUI

struct NutritionInfo: View {
    var body: some View {
        NavigationView {
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
                            //Text("CALORIAS")
                        }
                    }
                    ZStack{
                        NavigationLink(destination: CarbsView()){
                            VStack {
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
                            //Text("CARBOHIDRATOS")
                        }
                    }
                }
                .padding(10)
                HStack
                {
                    ZStack{
                        NavigationLink(destination: ProteinasView()){
                            VStack {
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
                            //Text("PROTEINAS")
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
                                                Text("LIPIDOS")
                                                    .padding()
                                            }
                                    )
                            }
                            //Text("GRASAS")
                        }
                    }
                }
                .padding(10)
        }
        }
    }
}
struct NutritionInfo_Previews: PreviewProvider {
    static var previews: some View {
        NutritionInfo().preferredColorScheme(.dark)
        
        NutritionInfo()
    }
}
