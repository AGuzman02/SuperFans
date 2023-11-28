//
//  PredictiveLabelView.swift
//  coreML-starter
//

import SwiftUI

struct PredictiveLabelView: View {
    private(set) var labelData: Classification
    @State private var isShowingMessage = false
    @EnvironmentObject var cartVM : cartViewModel
    @EnvironmentObject var classifierViewModel : ClassifierViewModel

    
    var body: some View {

        VStack(alignment: .center){
            
            Button("\(labelData.emoji)"){
                
                DispatchQueue.global().async{
                    DispatchQueue.main.async{
                        cartVM.addIng(labelData.label)
                        cartVM.addIng("salt")
                        cartVM.addVid(labelData.video)
                        isShowingMessage = true
                    }
                }
            }
            .padding()
            .background(Circle()
            .stroke(lineWidth: 3)
            .foregroundColor(Color.white))
            .font(.system(size: 50))
            
            
        }
        
        
       /* .popover(isPresented: $isShowingMessage){
            VStack{
                
                
                
                Text("\(cartVM.arrCart.last ?? "") se ha añadido al carrito")
                    .font(.title)
                    .padding(.bottom, 20)
                    .padding(.top)
                
                YoutubeView(videoID: cartVM.arrVid.last ?? "")
                    .padding()
                    .aspectRatio(contentMode: .fit)
                
                NavigationView{
                    NavigationLink(destination: cartView()){
                        VStack{
                            
                            Text("Ver Carrito")
                                .font(.system(size:35))
                                .foregroundColor(Color.white)
                                .padding(.top,5)

                        }
                    }
                        .ignoresSafeArea()
                        .padding()
                        .background(Color(.init(srgbRed: 130 / 255, green: 232 / 255, blue: 90 / 255, alpha: 0.75)))
                        .cornerRadius(25)
                        .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 10)
                    }
                }
            }*/
         
        }
    }


struct PredictiveLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PredictiveLabelView(labelData: Classification())
            .environmentObject(cartViewModel())
            .environmentObject(ClassifierViewModel())
            .preferredColorScheme(.dark)
    }
}
