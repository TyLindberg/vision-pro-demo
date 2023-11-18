//
//  PlayerView.swift
//  VisionProDemo
//
//  Created by ec2-user on 17/11/2023.
//

import AVFoundation
import AVKit
import SwiftUI
import RealityKit
import RealityKitContent

struct PlayerView: UIViewControllerRepresentable {
    
    @Environment(ViewModel.self) private var model

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        controller.player = AVPlayer()
        controller.player?.replaceCurrentItem(with: AVPlayerItem(url: URL(string: "https://tl-visionprodemo-202311.s3.us-west-2.amazonaws.com/videos/v1/0.mp4")!))
        return controller
    }
    
    func updateUIViewController(_ controller: AVPlayerViewController, context: Context) {
        if let exploreAction {
            controller.contextualActions = [exploreAction]
        }
        if ((controller.player?.currentItem?.asset) as? AVURLAsset)?.url.absoluteString != model.videoUrl {
            controller.player?.replaceCurrentItem(with: AVPlayerItem(url: URL(string: model.videoUrl)!))
        }
    }
    
    var exploreAction: UIAction? {
        return UIAction(title: "Explore") { _ in
            // Change to explore view
            model.explore = true
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView().environment(ViewModel())
}

