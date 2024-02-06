//
//  CircleButtonView.swift
//  Hibex
//
//  Created by admin on 5.11.2023.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent
                    .opacity(0.25),
                radius: 7
            
                )
            .padding()
    }
}

#Preview {
    Group{
        CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
        CircleButtonView(iconName: "heart")
            .previewLayout(.sizeThatFits)
        
    }
    
}
