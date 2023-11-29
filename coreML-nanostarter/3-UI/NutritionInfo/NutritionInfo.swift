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
                                                ZStack{
                                                    
                                                    Text("CALORIAS")
                                                        .padding(10)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.heavy)
                                                        .offset(x:2.2,y:1.5)
                                                    
                                                    Text("CALORIAS")
                                                        .padding(10)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.heavy)
                                                }
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
                                                ZStack{
                                                    
                                                    Text("CARBOHIDRATOS")
                                                        .padding(10)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.heavy)
                                                        .offset(x:2.2,y:1.5)
                                                    
                                                    Text("CARBOHIDRATOS")
                                                        .padding(10)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.heavy)
                                                }
                                                .multilineTextAlignment(.leading)
                                                
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
                                                ZStack{
                                                    
                                                    Text("PROTEINAS")
                                                        .padding(10)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.heavy)
                                                        .offset(x:2.2,y:1.5)
                                                    
                                                    Text("PROTEINAS")
                                                        .padding(10)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.heavy)
                                                }
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
                                                ZStack{
                                                    
                                                    Text("LIPIDOS")
                                                        .padding(10)
                                                        .foregroundColor(.black)
                                                        .fontWeight(.heavy)
                                                        .offset(x:2.2,y:1.5)
                                                    
                                                    Text("LIPIDOS")
                                                        .padding(10)
                                                        .foregroundColor(.white)
                                                        .fontWeight(.heavy)
                                                }
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
