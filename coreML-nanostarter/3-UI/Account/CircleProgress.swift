//
//  CircleProgress.swift
//  coreML-nanostarter
//
//  Created by Alumno on 22/11/23.
//

import SwiftUI

struct CircleProgress: View {
    let progress: Double
        
        var body: some View {
            ZStack {
                Circle()
                    .stroke(
                        Color.green.opacity(0.5),
                        lineWidth: 20
                    )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color.green,
                        style: StrokeStyle(
                            lineWidth: 20,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    // 1
                    .animation(.easeOut, value: progress)

            }.padding()
        }
}

struct CircleProgress_Previews: PreviewProvider {
    static var previews: some View {
        CircleProgress(progress: 10)
    }
}
