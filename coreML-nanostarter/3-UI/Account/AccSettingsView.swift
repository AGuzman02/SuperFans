//
//  AccSettingsView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct AccSettingsView: View {
    
    @EnvironmentObject var ViewModel : AccountViewModel
    @State private var name: String = ""
    @State private var weight: Double = 0.0
    @StateObject var updateWeightVM = UpdateWeightViewModel()
    @StateObject var updateVM = UpdateNameViewModel()
    
    var body: some View {
        VStack{
            Form{
                Section{
                    HStack {
                        
                        Text("Nombre:")
                        TextField("Nombre", text: $ViewModel.name)
                    }
                    HStack{
                        
                        Text("Edad:").frame(width: 50, alignment: .leading)
                        TextField("Edad", value: $ViewModel.age, formatter: NumberFormatter()).keyboardType(.numberPad)
                        Stepper("", value: $ViewModel.age, in: 0...120)
                    }
                    
                    HStack {
                        Text("Peso (kg):").frame(width: 77, alignment: .leading)
                        TextField("Peso", value: $ViewModel.weight, formatter: NumberFormatter()).keyboardType(.numberPad)
                        Stepper("", value: $ViewModel.weight, in: 0...300)
                    }
                    
                    HStack {
                        Text("Altura (m):").frame(width: 81, alignment: .leading)
                        TextField("Altura (m)", value: $ViewModel.height, format: .number)
                            .keyboardType(.decimalPad)
                        Stepper("", value: $ViewModel.height, in: 0...2.52, step: 0.01)
                    }
                }
            }
            VStack(alignment: .leading, spacing: 20) {
                // Sección para cambiar el nombre
                HStack {
                    TextField("Nombre", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding([.top, .leading, .trailing])
                    
                    Button("Cambiar nombre") {
                        Task {
                            do {
                                try await updateVM.updateUser(name: name)
                            } catch {
                                print("Error al cambiar el nombre: \(error)")
                            }
                        }
                    }
                }
                
                //Sección para cambiar el peso
                //UPDATE (PUT) Erick y Jeannette
                VStack(alignment: .leading, spacing: 10) {
                    //Text("Peso: \(weight) kg")
                    Stepper(value: $weight, in: 0...100, step: 1.0) {
                        //Text("Cambiar Peso")
                        Text("Peso: \(weight) kg")
                        TextField("Nombre", text: $name) .textFieldStyle(RoundedBorderTextFieldStyle()).padding([.top,  .leading, .trailing])
                        Button("Actualiza Nombre"){
                            Task{
                                do{
                                    try await updateVM.updateUser(name: name)
                                }
                                
                                Button("Guardar Cambios") {
                                    Task {
                                        do {
                                            try await updateWeightVM.updateUserWeight(weight: weight)
                                        } catch {
                                            print("Error al actualizar el peso: \(error)")
                                        }
                                    }
                                }
                            }
                        }
                        .padding([.top, .leading, .trailing])
                        
                        
                    }.padding()
                }
            }
        }
    }
    
    struct AccSettingsView_Previews: PreviewProvider {
        static var previews: some View {
            AccSettingsView().environmentObject(AccountViewModel())
            
            AccSettingsView().environmentObject(AccountViewModel())
                .previewDevice("iPhone SE (3rd generation)")
        }
    }
}
