//
//  HomeView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct SquaresView: View {
    
    @EnvironmentObject var ViewModel : AccountViewModel
    @EnvironmentObject var perfilModel : PerfilesViewModel

    
    var body: some View {
        VStack {
            /*
            NavigationLink(destination: SubirRecetaView()){
                VStack{
                    
                    Image(systemName: "plus")
                        .font(.system(size:70))
                        .foregroundColor(Color.white)
                    
                    Text("Subir Recetas")
                        .font(.system(size:35))
                        .foregroundColor(Color.white)
                        .padding(.top,5)

                }
            }
                .ignoresSafeArea()
                .padding()
                .background(Color(.init(srgbRed: 130 / 255, green: 232 / 255, blue: 90 / 255, alpha: 0.75)))
                .cornerRadius(25)
                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 10)
             */
            
            HStack {
                NavigationLink(destination: AlergiasView()){
                    VStack{
                        Image(systemName: "pencil.tip")
                            .foregroundColor(Color.white)
                            .font(.system(size:50))
                        
                        
                        Text("Alergias").font(.system(size:30))
                            .foregroundColor(Color.white)
                            .padding(.top,5)
                    }
                    .frame(width: 110, height: 110)
                    .ignoresSafeArea()
                    .padding()
                    .background(Color.green.opacity(0.5))
                    .cornerRadius(25)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 10)
                }
                
                Spacer()
                
                NavigationLink(destination: AccSettingsView()
                    .environmentObject(ViewModel)
                    .environmentObject(perfilModel)
                ){
                    
                    VStack{
                        Image(systemName: "pencil")
                            .foregroundColor(Color.white)
                            .font(.system(size:55))
                        
                        
                        Text("Perfil").font(.system(size:30))
                            .foregroundColor(Color.white)
                            .padding(.top,5)
                    }
                    .frame(width: 110, height: 110)
                    .ignoresSafeArea()
                    .padding()
                    .background(Color(.init(srgbRed: 75 / 255, green: 150 / 255, blue: 32 / 255, alpha: 0.75)))
                    .cornerRadius(25)
                    .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 10)
                }
            }.padding(.horizontal)
        }
        }
}

struct SquaresView_Previews: PreviewProvider {
    static var previews: some View {
        SquaresView()
            .environmentObject(AccountViewModel())
            .environmentObject(PerfilesViewModel())
            .previewDevice("iPhone 14 Pro Max")
        
        SquaresView()
            .environmentObject(AccountViewModel())
            .environmentObject(PerfilesViewModel())
            .previewDevice("iPhone SE (3rd generation)")
    }
}
