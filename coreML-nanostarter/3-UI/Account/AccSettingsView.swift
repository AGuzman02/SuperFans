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
                        
                        Text("Peso:").frame(width: 50, alignment: .leading)
                                                
                        TextField("Peso", value: $ViewModel.weight, formatter: NumberFormatter()).keyboardType(.numberPad)
                            .frame(width: 35)
                        
                        Text("kg")
                        
                        Stepper("", value: $ViewModel.weight, in: 0...300)
                    }
                    
                    HStack {
                        
                        Text("Altura:").frame(width: 50, alignment: .leading)
                        
                        TextField("Altura", value: $ViewModel.height, format: .number)
                            .keyboardType(.decimalPad)
                            .frame(width: 35)
                        
                        Text("m")
                        
                        Stepper("", value: $ViewModel.height, in: 0...2.52, step: 0.01)
                    }
                }
            }
            TextField("Nombre", text: $name) .textFieldStyle(RoundedBorderTextFieldStyle()).padding([.top,  .leading, .trailing])
            Button("Sign Up"){
                Task{
                    do{
                        try await updateVM.updateUser(name: name)
                    }
                    catch {
                        print("Registration error: \(error)")
                    }
                }
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
