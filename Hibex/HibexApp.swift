//
//  HibexApp.swift
//  Hibex
//
//  Created by admin on 1.11.2023.
//

import SwiftUI

@main
struct HibexApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView(content: {
                HomeView()
                    .toolbar(.hidden)
            })
            .environmentObject(vm)
            
        }
    }
}
