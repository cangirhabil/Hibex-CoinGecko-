//
//  CircleButtonAnimationView.swift
//  Hibex
//
//  Created by HCangir on 1.02.2024.
//

import SwiftUI

struct CircleButtonAnimationView: View {
   
    
    @Binding var animate:Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(.easeOut(duration: 0.75), value: animate)
            .onAppear(perform: {
                animate.toggle()
            })
            
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(true))
}
