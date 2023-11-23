//
//  AccountView.swift
//  coreML-nanostarter
//
//  Created by Alumno on 10/10/23.
//

import SwiftUI

//Erick y Jeannette GET de 1 perfil
struct AccountView: View {
    
    @StateObject private var ViewModel = AccountViewModel()
    @StateObject var perfilModel = PerfilesViewModel()
    @State private var currentCal = 0.0
    
    var body: some View {
        NavigationView{
                                    
            VStack(){
                HStack{
                    //Text("\(ViewModel.name)")
                    Text("\(perfilModel.perfil.first?.fname ?? "")")
                    Spacer()
                    Image(systemName: "person.crop.square.fill").foregroundColor(.green)
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
                        
                        Text(String(format: "%.0f kg", perfilModel.perfil.first?.weight ?? 0))
                    }
                    Divider().frame(height: 90)
                    VStack{
                        Text("Estatura").padding(.bottom, 11)
                        //Text(String(format:"%.2fm", ViewModel.height))
                        if let height = perfilModel.perfil.first?.height {
                                                    Text("\(height) m")
                                                } else {
                                                    Text("0.00 m")
                                                }
                    }
                    Divider().frame(height: 90)
                    VStack{
                        Text("Genero").padding(.bottom, 11)
                        Text((perfilModel.perfil.first?.gender ?? false) ? "M" : "F")
                    }
                    Spacer()
                }
                Divider()
                    VStack {
                        ZStack {
                                        // 2
                            CircleProgress(progress: currentCal)
                                        // 3
                            HStack{
                                Text("\((currentCal) * perfilModel.getTargetCal() * ViewModel.actFis, specifier: "%.0f")")
                                    .font(.largeTitle)
                                    .bold()
                                Text("kcal")
                                    .italic()
                                    .bold()
                            }
                        }
                        .frame(width: 200, height: 200)
                        
                        Spacer()
                        VStack {
                                        // 4
                            Slider(value: $currentCal, in: 0...1)
                            Text("Meta: \(perfilModel.getTargetCal() * ViewModel.actFis, specifier: "%.0f") calorias")
                                        // 5
                                        
                        }
                                
                        
                        SquaresView().environmentObject(ViewModel)
                            .environmentObject(perfilModel)
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
