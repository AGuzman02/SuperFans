//
//  CaloriasView.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 31/10/23.
//

import SwiftUI

struct CaloriasView: View {
    @StateObject var viewModel = PerfilesViewModel()
    var body: some View {


        Text("Calorias")
        .font(.title)
        .fontWeight(.bold)
        .padding(.bottom, 20)
        
        VStack {
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
                }
    }
}

#Preview {
    CaloriasView()
}
