//
//  AccountView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var ViewModel = AccountViewModel()
    @StateObject var perfilModel = PerfilesViewModel()
    
    var body: some View {
        NavigationView{
            VStack(){
                HStack{
                    //Text("\(ViewModel.name)")
                    Text("\(perfilModel.perfil.first?.fname ?? "")")
                    Spacer()
                    Image(systemName: "person.crop.square.fill")
                }
                Divider()
                ScrollView {
                HStack(alignment: .top){
                    Spacer()
                    VStack{
                        Text("Edad").padding(.bottom, 11)
                        //Text("\(ViewModel.age)")
                        Text("\(perfilModel.perfil.first?.age ?? 0)")
                    }
                    Divider().frame(height: 90)
                    VStack{
                        Text("Peso").padding(.bottom, 11)
                        //Text("\(ViewModel.weight)kg")
                        Text(String(format: "%.1fkg", perfilModel.perfil.first?.weight ?? 0))
                    }
                    Divider().frame(height: 90)
                    VStack{
                        Text("Estatura").padding(.bottom, 11)
                        Text(String(format:"%.2fm", ViewModel.height))
                    }
                    Divider().frame(height: 90)
                    VStack{
                        Text("Genero").padding(.bottom, 11)
                        Text(ViewModel.gender ? "M" : "F")
                    }
                    Spacer()
                }
                Divider()
                    VStack {
                        SquaresView().environmentObject(ViewModel)
                            .padding(.top)
                    }
                }
                
                .task{
                        do{
                            try await perfilModel.getPerfilData()
                        }
                        catch {
                            print("Registration error: \(error)")
                        }
                    }
                                
            }.ignoresSafeArea()
                .padding()
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
        .previewDevice("iPhone 14 Pro Max")
        .environmentObject(AccountViewModel())
        
        AccountView()
            .environmentObject(AccountViewModel())
            .previewDevice("iPhone SE (3rd generation)")
    }
}
