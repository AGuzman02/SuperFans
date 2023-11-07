//
//  ClassificationView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct ClassificationView: View {
    @EnvironmentObject var predictionStatus: PredictionStatus
    @StateObject var classifierViewModel = ClassifierViewModel()
    
    var body: some View {
        let predictionLabel = predictionStatus.topLabel

        NavigationView {
            GeometryReader { geo in
     
                        VStack {

                            
                            ZStack{
                                
                                LiveCameraRepresentable() {
                                    predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                                }.ignoresSafeArea()
                                
                                VStack {
                                    HStack{
                                        
                                        Spacer()
                                        
                                        NavigationLink(destination: cartView()){
                                            Image(systemName: "cart.fill")
                                                .font(.system(size:40))
                                        }
                                    }.padding(.trailing)
                                    
                                    Spacer()
                                }
                                
                                RoundedRectangle(cornerRadius: 20).stroke(Color.green, lineWidth: 2)
                                    .frame(width: geo.size.width/1.3, height: geo.size.height/2.4)
                            }
                            
                            PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))
                                .frame(width: geo.size.width, height: geo.size.height * 0.25)
                                
                        }
                        .onAppear(perform: classifierViewModel.loadJSON)
                    .frame(width: geo.size.width, height: geo.size.height)
            }
        }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView()
            .previewDevice("iPhone 14 Pro Max")
            .environmentObject(PredictionStatus())
            .environmentObject(cartViewModel())
            .preferredColorScheme(.dark)
        
        ClassificationView()
            .previewDevice("iPhone SE (3rd generation)")
            .environmentObject(PredictionStatus())
            .environmentObject(cartViewModel())
            
        
    }
}
