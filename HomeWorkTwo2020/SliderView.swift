//
//  SliderView.swift
//  HomeWorkTwo2020
//
//  Created by Борис Крисько on 25.07.2020.
//  Copyright © 2020 Borys Krisko. All rights reserved.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    @State private var textFiedValue = ""
    @State private var showingAlert = false
    var color: Color
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
                .padding(.leading, 16.0)
            
            Slider(value: Binding( get: {
                self.value
            },
                                   set: {(newValue) in
                                    self.value = newValue
                                    self.changeTextFieldValue()
            }), in: 0...255)
                .accentColor(color)
                .padding()
            
            TextField("0", text: $textFiedValue, onEditingChanged: { (_) in
            })
            {
                self.changeSliderValue()
            }
            .padding(.trailing, 5.0)
            .frame(width: 60.0)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Wrong format"),
                      message: Text("Enter number 0...255"),
                      dismissButton: .default(Text("OK")))
            })
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    var sliderColor: UIColor
    static var previews: some View {
        SliderView(value: .constant(0.0), color: .red)
    }
}

extension SliderView {
    private func changeTextFieldValue(){
        textFiedValue = String(lround(value))
    }
    
    private func changeSliderValue() {
    
                if let rightValue = Double(self.textFiedValue){
                    if rightValue <= 255 {
                        value = rightValue
                    } else {
                        showingAlert = true
                        textFiedValue = "0"
                        value = 0.0
                    }
                } else {
                    showingAlert = true
                    textFiedValue = "0"
                    value = 0.0
                }
    }
}
