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
                
               //DispatchQueue.global().async{
                    DispatchQueue.main.async{
                        cartVM.addIng(labelData.label.lowercased())
                        cartVM.addVid(labelData.video)
                        isShowingMessage = true
                    }
                //}
            }
            .padding()
            .background(Circle()
            .stroke(lineWidth: 3)
            .foregroundColor(Color.white))
            .font(.system(size: 50))
            
            
        }
        .alert(isPresented: $isShowingMessage) {
            Alert(
                title: Text("\(cartVM.arrCart.last ?? "") se añadió al carrito"),
                dismissButton: .default(Text("Cerrar").foregroundColor(Color.green))
                /*
                    YoutubeView(videoID: cartVM.arrVid.last ?? "")
                        .padding()
                        .aspectRatio(contentMode: .fit)     
                    
                     NavigationLink(destination: cartView().environmentObject(cartVM)) {
                     Text("Ver Carrito")
                     .font(.system(size: 35))
                     .foregroundColor(Color.white)
                     .padding(.top, 5)
                     }
                     .background(
                     RoundedRectangle(cornerRadius: 10)
                     .foregroundColor(Color(.init(srgbRed: 130 / 255, green: 232 / 255, blue: 90 / 255, alpha: 0.75)))
                     .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5), lineWidth: 1))
                     .padding()
                     )
                */
            )
        }
         
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
