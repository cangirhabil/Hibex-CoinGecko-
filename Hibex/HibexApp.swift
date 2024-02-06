//
//  HibexApp.swift
//  Hibex
//
//  Created by admin on 1.11.2023.
//

import SwiftUI

@main
struct HibexApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .navigationBarBackButtonHidden(true)
        }
    }
}
