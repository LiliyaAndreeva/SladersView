//
//  ButtonView.swift
//  SladersView
//
//  Created by Лилия Андреева on 23.12.2023.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(
                    size: 25,
                    weight: .medium,
                    design: .rounded
                )
                )
            
        }
    }
}

#Preview {
    ButtonView(title: "Проверь меня", action: {})
}
