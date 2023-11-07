//
//  AccSettingsView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct AccSettingsView: View {
    
    @EnvironmentObject var ViewModel : AccountViewModel
    @StateObject var perfilesVM = PerfilesViewModel()
   // @StateObject var viewModel = PerfilesViewModel()

    
    
    var body: some View {
        /*VStack {
                    Text("First Name: \(viewModel.perfil.first?.fname ?? "")")
                    Text("Last Name: \(viewModel.perfil.first?.lname ?? "")")
                    Text("Age: \(viewModel.perfil.first?.age ?? 0)")
                    Text("Gender: \(viewModel.perfil.first?.gender == true ? "Male" : "Female")")
                    Text("Height: \(viewModel.perfil.first?.height ?? 0)")
                    Text("Weight: \(viewModel.perfil.first?.weight ?? 0.0)")
                    Text("User ID: \(viewModel.perfil.first?.iduser ?? 0)")
                    Text("Profile ID: \(viewModel.perfil.first?.idperfil ?? 0)")
                }
                .task {
                    do {
                        try await viewModel.getPerfilData()
                    } catch {
                        print("Error: \(error.localizedDescription)")
                    }
                }*/

        VStack{
            
            
            Form{
                
                
                Section{
                    TextField("Nombre", text: $ViewModel.name)
                    //TextField("Nombre", text: $perfilesVM.perfil.first?.fname ?? "")

                    
                    
                    HStack{
                        
                        Text("Edad:")
                        
                        TextField("Edad", value: $ViewModel.age, formatter: NumberFormatter()).keyboardType(.numberPad)
                            
                        Stepper("", value: $ViewModel.age, in: 0...120)
                    }
                    
                    HStack {
                        
                        Text("Peso:")
                        
                        TextField("Peso", value: $ViewModel.weight, formatter: NumberFormatter()).keyboardType(.numberPad)
                            .frame(width: 25)
                        
                        Text("kg")
                        
                        Stepper("", value: $ViewModel.weight, in: 0...300)
                    }
                    
                    HStack {
                        
                        TextField("Peso", value: $ViewModel.height, formatter: NumberFormatter()).keyboardType(.numberPad)
                            .frame(width: 25)
                        
                        Stepper("Altura: \(ViewModel.height , specifier: "%.2f") m", value: $ViewModel.height, in: 0...2.52, step: 0.01)
                    }
                    
                    .task {
                        do {
                            try await perfilesVM.getPerfilData()
                        } catch {
                            print("Error: \(error.localizedDescription)")
                        }
                    }
                }

            }

            
        }
    }
}

struct AccSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccSettingsView().environmentObject(AccountViewModel())
    }
}
