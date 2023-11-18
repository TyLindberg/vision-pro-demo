//
//  VisionProDemoApp.swift
//  VisionProDemo
//
//  Created by ec2-user on 17/11/2023.
//

import SwiftUI

@main
struct VisionProDemoApp: App {
    // The view model.
    @State private var model = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(model)
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView().environment(model)
        }
    }
}
