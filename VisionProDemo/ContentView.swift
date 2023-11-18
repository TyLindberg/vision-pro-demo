/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A view that presents the app's user interface.
*/

import SwiftUI

// The app uses `LibraryView` as its main UI.
struct ContentView: View {
    
    @Environment(ViewModel.self) private var model
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    /// A Boolean value that indicates whether the app is currently presenting an immersive space.
    @State private var isPresentingSpace = false
    
    var body: some View {
        let player = PlayerView()
        player.onChange(of: model.explore) {_, explore in
            Task {
                if explore {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
}
