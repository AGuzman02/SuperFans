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
                Image("carbonara") //apartado1
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                Image("carbonara") //apartado2
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(radius: 5)
            }
            .padding(10)
            HStack
            {
                Image("carbonara") //apartado 3
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                Image("carbonara") //apartado 4
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(radius: 5) 
            }
            .padding(10)
        }
    }
}

#Preview {
    NutritionInfo()
}
