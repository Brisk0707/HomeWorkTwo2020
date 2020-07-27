//
//  ContentView.swift
//  HomeWorkTwo2020
//
//  Created by Борис Крисько on 25.07.2020.
//  Copyright © 2020 Borys Krisko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 0.0
    @State private var blueSliderValue = 0.0
    @State private var greenSliderValue = 0.0
    var body: some View {
        
        ZStack {
            Color(red: 0.56, green: 0.84, blue: 0.97)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Color(red: redSliderValue / 255,
                      green: greenSliderValue / 255,
                      blue: blueSliderValue / 255)
                    .frame(width: 300, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                
                VStack {
                    SliderView(value: $redSliderValue, color: .red)
                    SliderView(value: $blueSliderValue, color: .blue)
                    SliderView(value: $greenSliderValue, color: .green)
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
