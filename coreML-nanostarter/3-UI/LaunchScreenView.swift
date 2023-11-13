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
    @StateObject var loginVM = LogInViewModel()

    
    var body: some View {
        NavigationView {
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
                            // about page
                            NavigationLink(destination: Contraview()){
                                Text("Olvidé mi contraseña")
                                    .foregroundColor(Color.green)
                            }.padding(.trailing)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            
                            HStack{
                                
                                NavigationLink(destination: MainView()){
                                    Text("Enter")
                                        .frame(width:65, height: 15)
                                }.isDetailLink(false)
                                    .buttonStyle(RoundedRectButtonStyle(buttonColor: .green))
                                
                                //Log In (POST) Erick y Jeannette
                                Button("Log In"){
                                    Task{
                                        do{
                                            try await loginVM.loginUser(username: user, password: pass)
                                        }
                                        catch {
                                            print("Login error: \(error)")
                                        }
                                    }
                                }
                                
                                NavigationLink(destination: SignUpView()){
                                    Text("Sign Up")
                                        .frame(width:65, height: 15)
                                }.isDetailLink(false)
                                    .buttonStyle(RoundedRectButtonStyle(buttonColor: .green.opacity(0.7)))
                                    
                          
                            }.padding(.vertical,8)
                            
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
                    .background(Color(UIColor.systemBackground))
                    .cornerRadius(25)
                .shadow(radius: 5)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .previewDevice("iPhone SE (3rd generation)")
        
        LaunchScreenView()
            .previewDevice("iPhone SE (3rd generation)")
            .preferredColorScheme(.dark)
        
        LaunchScreenView()
            .previewDevice("iPhone 14 Pro Max")
        
        LaunchScreenView()
            .previewDevice("iPhone 14 Pro Max")
            .preferredColorScheme(.dark)
    }
}
