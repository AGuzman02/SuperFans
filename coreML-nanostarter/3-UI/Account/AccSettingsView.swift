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
                    
                }
                Section{
                    Stepper(value: $ViewModel.age, in: 0...100, step:1) {
                        Text("\(ViewModel.age)")
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
