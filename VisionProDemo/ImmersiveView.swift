//
//  ImmersiveView.swift
//  VisionProDemo
//
//  Created by ec2-user on 17/11/2023.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        RealityView { content in
            for index in 3...22 {
                // Build thumbnail object
                var thumbNailMaterial = UnlitMaterial()
                
                // Remote loading of URLs referenced from here:
                // https://developer.apple.com/forums/thread/664280
                let remoteURL = URL(string: "https://tl-visionprodemo-202311.s3.us-west-2.amazonaws.com/thumbnails/v1/" + String(index) + ".jpg")!
                // Create a temporary file URL to store the image at the remote URL.
                let fileURL = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
                // Download contents of imageURL as Data.  Use a URLSession if you want to do this asynchronously.
                let data = try! Data(contentsOf: remoteURL)
                
                // Write the image Data to the file URL.
                try! data.write(to: fileURL)
                
                thumbNailMaterial.color.texture = MaterialParameters.Texture( try! await TextureResource(contentsOf: fileURL))
                let thumbnailEntity = ModelEntity(mesh:  MeshResource.generateBox(size: 30, cornerRadius: 2), materials: [thumbNailMaterial])
                
                // Place thumbnail object in spherical space centered approximately
                // around the head
//                struct RandomNumberGeneratorWithSeed: RandomNumberGenerator {
//                    init(seed: Int) {
//                        // Set the random seed
//                        srand48(seed)
//                    }
//                    
//                    func next() -> UInt64 {
//                        // drand48() returns a Double, transform to UInt64
//                        return withUnsafeBytes(of: drand48()) { bytes in
//                            bytes.load(as: UInt64.self)
//                        }
//                    }
//                }
                
                let headHeight = Float(120)
                let radius = Float.random(in: 150...500)
                let theta = Float.random(in: (Float.pi / 6)...(Float.pi * 5 / 6))
                let phi = Float.random(in: Float.pi...(2 * Float.pi))
                
                
                thumbnailEntity.position = SIMD3(
                    x: radius * sin(theta) * cos(phi),
                    y: headHeight + radius * cos(theta),
                    z: radius * sin(theta) * sin(phi))
                
                // Scale box to look like plane
                thumbnailEntity.scale = SIMD3(x: 1.77777, y: 1, z: 0.00001)
                
                // Make each object "look at" the head
                thumbnailEntity.look(at: SIMD3(0, headHeight, 0), from: thumbnailEntity.position, relativeTo: nil, forward: .positiveZ)
                
                // TODO: Add collision to the box
//                let collisionComponent = CollisionComponent(shapes: [ShapeResource.generateBox(size: SIMD3(x: 50, y: 50, z: 50))])
//                thumbnailEntity.components.set(collisionComponent)
                
                thumbnailEntity.name = String(index)
                
                content.add(thumbnailEntity)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded {value in
            model.explore = false
            model.videoUrl = "https://tl-visionprodemo-202311.s3.us-west-2.amazonaws.com/videos/v1/" + value.entity.name + ".mp4"
        })
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
        .environment(ViewModel())
}
