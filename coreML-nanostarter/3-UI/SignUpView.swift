//
//  SignUpView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 31/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var registerVM = SignUpViewModel()
    @State private var user: String = ""
    @State private var pass: String = ""
    
    var body: some View {
        ZStack {
            
            Color(hex: 0xb0f2c2, opacity: 1.0)
                .ignoresSafeArea()
            
            ZStack {
                VStack {
                    
                    Text("SuperFans")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .padding(.top)
                    
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                    
                    Divider()
                    
                    VStack{
                        TextField("Username", text: $user) .textFieldStyle(RoundedBorderTextFieldStyle()).padding([.top,  .leading, .trailing])
                        
                        SecureField("Password", text: $pass)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).padding([.leading, .trailing])
                        
                        HStack{
                            
                            Button("Sign Up"){
                                Task{
                                    do{
                                        try await registerVM.registerUser(username: user, password: pass)
                                    }
                                    catch {
                                        print("Registration error: \(error)")
                                    }
                                }
                            }
                            .buttonStyle(RoundedRectButtonStyle(buttonColor: .green))
                        }.padding(.vertical)
                        
                    }
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.top)
                    
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(25)
                .shadow(radius: 5)
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
