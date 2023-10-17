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
        ZStack {
            
            //[OPTIONAL] Edit background color here.
            Color.green
                .opacity(0.5)
                .ignoresSafeArea()

            GeometryReader { geo in
                VStack {
                    LiveCameraRepresentable() {
                        predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                    }
                    
                    PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel))
                    
                }
                .onAppear(perform: classifierViewModel.loadJSON)
                .frame(width: geo.size.width)
            }
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
