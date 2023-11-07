//
//  PredictiveLabelView.swift
//  coreML-starter
//

import SwiftUI

struct PredictiveLabelView: View {
    private(set) var labelData: Classification
    @State private var isShowingMessage = false
    @EnvironmentObject var cartVM: cartViewModel

    
    var body: some View {

        VStack(alignment: .center){
            
            Button("\(labelData.emoji)"){
                
                cartVM.addIng(labelData.label)
                
                isShowingMessage = true
            }
            .padding()
            .background(Circle()
            .stroke(lineWidth: 3)
            .foregroundColor(Color.white))
            .font(.system(size: 50))
            
        }.popover(isPresented: $isShowingMessage, arrowEdge: .top){
            VStack{
                Text("\(labelData.label) se ha añadido al carrito")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                YoutubeView(videoID: labelData.video)
                    .padding()
                    .aspectRatio(contentMode: .fit)
                
                List {
                    ForEach(cartVM.arrCart, id: \.self)
                    { item in
                        Text(item)
                    }
                }
                
            }.padding(.top)
        }
    }
}

struct PredictiveLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PredictiveLabelView(labelData: Classification())
            .environmentObject(cartViewModel())
            .preferredColorScheme(.dark)
    }
}
