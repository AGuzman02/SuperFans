//
//  PredictiveLabelView.swift
//  coreML-starter
//

import SwiftUI

struct PredictiveLabelView: View {
    private(set) var labelData: Classification
    @State private var isShowingMessage = false
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Button("\(labelData.emoji)"){
                    isShowingMessage = true
                }
                .padding()
                .background(Circle()
                    .stroke(lineWidth: 3)
                    .foregroundColor(Color.white))
                .font(.system(size: 50))
            
        }.alert(isPresented: $isShowingMessage){
            Alert(title: Text("Carrito"), message: Text("\(labelData.label) se ha añadido al carrito"), dismissButton: .default(Text("OK")))
        }
    }
}

struct PredictiveLabelView_Previews: PreviewProvider {
    static var previews: some View {
        PredictiveLabelView(labelData: Classification()).preferredColorScheme(.dark)
    }
}
