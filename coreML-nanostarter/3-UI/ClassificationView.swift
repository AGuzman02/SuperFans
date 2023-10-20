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

            GeometryReader { geo in
                VStack {
                    LiveCameraRepresentable() {
                        predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                    }.ignoresSafeArea()
                                        
                    PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))
                        .frame(width: geo.size.width, height: geo.size.height * 0.25)
                }
                .onAppear(perform: classifierViewModel.loadJSON)
                .frame(width: geo.size.width, height: geo.size.height)
            }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView()
            .previewDevice("iPhone 14 Pro Max").environmentObject(PredictionStatus())
        
        ClassificationView()
            .previewDevice("iPhone SE (3rd generation)").environmentObject(PredictionStatus())
            
        
    }
}
