//
//  HomeView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct SquaresView: View {
    
    @EnvironmentObject var ViewModel : AccountViewModel

    
    var body: some View {
        HStack {
            VStack{
                    Text("Alergias").font(.system(size:30))
                        .foregroundColor(Color.white)
                        .padding(.top,5)
                    
                    NavigationLink(destination: AlergiasView()){
                        Image(systemName: "plus")
                            .scaleEffect(3)
                            .padding(.bottom,5)
                    }
                    .buttonStyle(RoundedRectButtonStyle(buttonColor: .red))
                }
            .frame(width: 110)
                .ignoresSafeArea()
                .padding()
                .background(Color.red)
                .cornerRadius(25)
            .shadow(color: Color.orange.opacity(0.5), radius: 5, x: 5, y: 10)
            Spacer()
            VStack{
                    Text("Perfil").font(.system(size:30))
                        .foregroundColor(Color.white)
                        .padding(.top,5)
                    
                NavigationLink(destination: AccSettingsView().environmentObject(ViewModel)){
                        Image(systemName: "pencil")
                            .scaleEffect(3)
                            .padding(.bottom,5)
                    }
                    .buttonStyle(RoundedRectButtonStyle(buttonColor: .blue))
                }
            .frame(width:110)
                .ignoresSafeArea()
                .padding()
                .background(Color.blue)
                .cornerRadius(25)
                .shadow(color: Color.blue.opacity(0.5), radius: 5, x: 5, y: 10)
        }
        }
}

struct SquaresView_Previews: PreviewProvider {
    static var previews: some View {
        SquaresView()
            .previewDevice("iPhone 14 Pro Max")
        
        SquaresView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
