//
//  SliderRepresentation.swift
//  SladersView
//
//  Created by Лилия Андреева on 23.12.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
   
    @Binding var slidersValue: Double
    var opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .blue
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didTapDone),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(slidersValue)
        uiView.thumbTintColor = .tintColor.withAlphaComponent(CGFloat(opacity))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(slidersValue: $slidersValue)
    }
    
    
    
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        
        @Binding var slidersValue: Double
        
        init(slidersValue: Binding<Double>) {
            self._slidersValue = slidersValue
        }
        
        @objc
        func didTapDone(_ sender: UISlider){
            slidersValue = Double(sender.value)
        }
    }
}

#Preview{
    UISliderRepresentation(slidersValue: .constant(50), opacity: 50)
}
