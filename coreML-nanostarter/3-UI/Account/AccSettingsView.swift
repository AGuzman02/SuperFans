//
//  AccSettingsView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 12/10/23.
//

import SwiftUI

struct AccSettingsView: View {
    
    @EnvironmentObject var ViewModel : AccountViewModel
    
    
    var body: some View {
        VStack{
            
            
            Form{
                
                
                Section{
                    TextField("Nombre", text: $ViewModel.name)
                    
                    
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
