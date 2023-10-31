//
//  AlergiasView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct Allergy: Identifiable {
    var id = UUID()
    var name: String
    var isChecked: Bool
}

struct CheckboxField: View {
    @Binding var isChecked: Bool
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 25, height: 25)
                .onTapGesture {
                    isChecked.toggle()
                }
            Text(text)
        }
    }
}

struct AlergiasView: View {
    @State private var allergies: [Allergy] = [
            Allergy(name: "Nueces", isChecked: false),
            Allergy(name: "Gluten", isChecked: false),
            Allergy(name: "Lacteos", isChecked: false),
            Allergy(name: "Soja", isChecked: false),
            // Agrega más alergias aquí
        ]

        var body: some View {
            VStack (alignment:.leading) {
                Text("Selecciona tus alergias:")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
 
                ForEach(allergies.indices, id: \.self) { index in
                    CheckboxField(isChecked: $allergies[index].isChecked, text: allergies[index].name)
                    .font(.title)
                }
            }
            .foregroundColor(.green)
            
        }
}

struct AlergiasView_Previews: PreviewProvider {
    static var previews: some View {
        AlergiasView()
    }
}
