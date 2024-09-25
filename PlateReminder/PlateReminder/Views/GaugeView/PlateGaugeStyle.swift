//
//  PlateGaugeStyle.swift
//  PlateReminder
//
//  Created by Rowan on 9/25/24.
//

import SwiftUI

struct PlateGaugeStyle: GaugeStyle {
    private let gaugeGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 3/255, green: 84/255, blue: 78/255),
            Color(red: 234/255, green: 248/255, blue: 246/255)
        ]),
        startPoint: .trailing,
        endPoint: .leading
    )
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            ZStack {
                Circle()
                    .foregroundStyle(.background)
                
                Image("WavePlate").resizable()
                
                Circle()
                    .trim(from: 0, to: configuration.value * 0.75)
                    .stroke(gaugeGradient, lineWidth: 20.0)
                    .rotationEffect(.degrees(135))
            }
            
            configuration.currentValueLabel
                .font(.system(size: 60, weight: .bold, design: .rounded))
                .foregroundStyle(.black)
        }
    }
}
