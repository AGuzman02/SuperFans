//
//  LaunchScreenView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct LaunchScreenView: View {
    
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
                        .padding()
                        .foregroundColor(.green)
                    
                    Image(systemName: "fork.knife.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                    
                    Divider()
                    
                    VStack{
                        TextField("Username", text: $user) .textFieldStyle(RoundedBorderTextFieldStyle()).padding([.top,  .leading, .trailing])
                        
                        SecureField("Password", text: $pass)
                            .textFieldStyle(RoundedBorderTextFieldStyle()).padding([  .leading, .trailing])
                        // about page
                        NavigationLink(destination: AboutView()){
                            Text("Olvidé mi contraseña")
                                .foregroundColor(Color.green)
                        }.padding(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                        NavigationLink(destination: MainView()){
                            Text("Login")
                        }.isDetailLink(false)
                        .buttonStyle(RoundedRectButtonStyle(buttonColor: .green))
                        .padding(.bottom)
                        
                        Text("Ingresar con:").padding(.bottom)
                        HStack{
                            Image(systemName: "apple.logo").padding(.trailing)
                            Image(systemName: "envelope.fill")
                        }.padding(.bottom)
                    }
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.top)
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(25)
            .shadow(radius: 5)
            }
            .padding()
        }.ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .previewDevice("iPhone SE (3rd generation)")
        
        LaunchScreenView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
