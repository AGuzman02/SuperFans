//
//  AccSettingsView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct AccSettingsView: View {
    
    @EnvironmentObject var ViewModel : AccountViewModel
    @EnvironmentObject var perfilModel : PerfilesViewModel
    @State private var name: String = ""
    @State private var weight: Int = 0
    @State private var buttonSize: CGFloat = 60
    @StateObject var updateWeightVM = UpdateWeightViewModel()
    @StateObject var updateVM = UpdateNameViewModel()
    
    var body: some View {
        VStack{
            Form{
                Section{
                    HStack {
                        
                        Text("Nombre:")
                        TextField("Nombre", text: ($perfilModel.perfil.first?.fname ?? $ViewModel.name))
                        
                    }
                    HStack{
                        
                        Text("Edad:").frame(width: 50, alignment: .leading)
                        TextField("Edad", value: ($perfilModel.perfil.first?.age ?? $ViewModel.age), formatter: NumberFormatter()).keyboardType(.numberPad)
                        Stepper("", value: ($perfilModel.perfil.first?.age ?? $ViewModel.age), in: 0...120)
                    }
                    
                    HStack {
                        Text("Peso (kg):").frame(width: 77, alignment: .leading)
                        TextField("Peso", value: $perfilModel.perfil.first?.weight ?? .constant(0), formatter: NumberFormatter())
                            .keyboardType(.numberPad)

                        Stepper("", value: $perfilModel.perfil.first?.weight ?? .constant(0), in: 0...300)
                    }
                    
                    HStack {
                        Text("Altura (cm):").frame(width: 90, alignment: .leading)
                        TextField("Altura (cm)", value: ($perfilModel.perfil.first?.height ?? $ViewModel.height), format: .number)
                            .keyboardType(.decimalPad)
                        Stepper("", value: ($perfilModel.perfil.first?.height ?? $ViewModel.height), in: 0...252, step: 1)
                    }
                    
                    VStack() {
                        Text("Activida Fìsica Por Semana (Dias)")
                        HStack() {
                            Button(action: {
                                ViewModel.actFis = 1.3
                            }) {
                                Text("0")
                                    .padding()
                                    .frame(minWidth: buttonSize, minHeight: buttonSize)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                ViewModel.actFis = perfilModel.perfil.first?.gender ?? ViewModel.gender ? 1.6 : 1.5
                            }) {
                                Text("1-3")
                                    .padding()
                                    .frame(minWidth: buttonSize, minHeight: buttonSize)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                ViewModel.actFis = perfilModel.perfil.first?.gender ?? ViewModel.gender ? 1.7: 1.6
                            }) {
                                Text("3-5")
                                    .padding()
                                    .frame(minWidth: buttonSize, minHeight: buttonSize)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                ViewModel.actFis = perfilModel.perfil.first?.gender ?? ViewModel.gender ? 2.1 : 1.9
                            }) {
                                Text("5-7")
                                    .padding()
                                    .frame(minWidth: buttonSize, minHeight: buttonSize)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: {
                                ViewModel.actFis = perfilModel.perfil.first?.gender ?? ViewModel.gender ? 2.4 : 2.2
                            }) {
                                Text("7+")
                                    .padding()
                                    .frame(minWidth: buttonSize, minHeight: buttonSize)
                                    .background(Color.green)
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                            }
                        }
                        
                    }
                    
                    VStack{
                        Button("Actualizar") {
                            Task {
                                do {
                                    try await updateWeightVM.updateUserWeight(weight: perfilModel.perfil.first?.weight ?? 0)
                                    try await updateVM.updateUser(name: perfilModel.perfil.first?.fname ?? "")

                                } catch {
                                    print("Error al actualizar el peso: \(error)")
                                }
                            }
                        }
                        .frame(maxWidth: .infinity) // Expand button width to fill the container
                    }
                }.buttonStyle(BorderlessButtonStyle())
            }
            .task{
                    do{
                        try await perfilModel.getPerfilData()
                    }
                    catch {
                        print("Registration error: \(error)")
                    }
                }
        }
    }
    
    struct AccSettingsView_Previews: PreviewProvider {
        static var previews: some View {
            AccSettingsView()
                .environmentObject(AccountViewModel())
                .environmentObject(PerfilesViewModel())
            
            AccSettingsView()
                .environmentObject(AccountViewModel())
                .environmentObject(PerfilesViewModel())
                .preferredColorScheme(.dark)
            
            AccSettingsView()
                .environmentObject(AccountViewModel())
                .environmentObject(PerfilesViewModel())
                .previewDevice("iPhone SE (3rd generation)")
        }
    }
}
