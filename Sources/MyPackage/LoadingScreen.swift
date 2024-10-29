import SwiftUI

/// A customizable loading screen that can be reused across different views.
///
/// - Parameters:
///   - isLoading: A binding to a Boolean value that indicates whether the loading screen should be visible.
///   - backgroundColor: The background color of the loading screen. Default is `.black.opacity(0.5)`.
///   - spinnerSize: The size of the loading spinner. Default is `50`.
///   - spinnerColor: The color of the loading spinner. Default is `.white`.
///   - customSpinner: A custom spinner view to use instead of the default ProgressView.
public struct LoadingScreen<CustomSpinner: View>: View {
    @Binding public var isLoading: Bool
    public var backgroundColor: Color = .black.opacity(0.5)
    public var spinnerSize: CGFloat = 50
    public var spinnerColor: Color = .white
    public var customSpinner: (() -> CustomSpinner)? = nil
    
    public init(isLoading: Binding<Bool>, backgroundColor: Color = .black.opacity(0.5), spinnerSize: CGFloat = 50, spinnerColor: Color = .white, customSpinner: (() -> CustomSpinner)? = nil) {
        self._isLoading = isLoading
        self.backgroundColor = backgroundColor
        self.spinnerSize = spinnerSize
        self.spinnerColor = spinnerColor
        self.customSpinner = customSpinner
    }
    
    public var body: some View {
        if isLoading {
            ZStack {
                backgroundColor
                    .edgesIgnoringSafeArea(.all)
                if let customSpinner = customSpinner {
                    customSpinner()
                        .frame(width: spinnerSize, height: spinnerSize)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: spinnerColor))
                        .frame(width: spinnerSize, height: spinnerSize)
                        .scaleEffect(1.5)
                }
            }
            .transition(.opacity)
            .animation(.easeInOut, value: isLoading)
        }
    }
}

struct LoadingScreen_Previews: PreviewProvider {
    @State static var isLoading = true
    static var previews: some View {
        LoadingScreen(isLoading: $isLoading, customSpinner: {
            Image(systemName: "hourglass")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        })
    }
}
