//
//  AccountView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

struct AccountView: View {
    
    @StateObject private var ViewModel = AccountViewModel()
    //@StateObject var perfilesVM = PerfilesViewModel()
    @StateObject var viewModel = PerfilesViewModel()
    
    var body: some View {
        
        NavigationView{
            
            VStack(){
                HStack{
                    //Text("First Name: \(viewModel.perfil.first?.fname ?? "")")
                    Text("\(viewModel.perfil.first?.fname ?? "")")
                    Spacer()
                    Image(systemName: "person.crop.square.fill")
                }
                Divider()
                ScrollView {
                HStack(alignment: .top){
                    Spacer()
                    VStack{
                        Text("Edad").padding(.bottom, 11)
                        Text("\(ViewModel.age)")
                    }
                    Divider().frame(height: 90)
                    VStack{
                        Text("Peso").padding(.bottom, 11)
                        Text("\(ViewModel.weight)kg")
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
                .task {
                    do {
                        try await viewModel.getPerfilData()
                    } catch {
                        print("Error: \(error.localizedDescription)")
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
        
        AccountView()
            .previewDevice("iPhone SE (3rd generation)")
    }
}
