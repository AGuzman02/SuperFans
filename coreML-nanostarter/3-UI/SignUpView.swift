//
//  SignUpView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 31/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    var body: some View {
        ZStack {
            
            Color(hex: 0xb0f2c2, opacity: 1.0)
                .ignoresSafeArea()
            
            ZStack {
                VStack {
                    
                    Text("Recuperar Contraseña")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.green)
                    
                    
                    Divider()
                    
                }
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .cornerRadius(25)
            .shadow(radius: 5)
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
