import SwiftUI

/// A customizable button with loading state and adjustable styles.
///
/// - Parameters:
///   - title: The text displayed on the button when not in loading state.
///   - action: The closure executed when the button is pressed.
///   - isLoading: A binding to a Boolean value that indicates whether the button is in a loading state.
///   - backgroundColor: The background color of the button. Default is `.blue`.
///   - foregroundColor: The text color of the button. Default is `.white`.
///   - cornerRadius: The corner radius of the button. Default is `10`.
public struct CustomButton: View {
    public var title: String
    public var action: () -> Void
    @Binding public var isLoading: Bool
    public var backgroundColor: Color = .blue
    public var foregroundColor: Color = .white
    public var cornerRadius: CGFloat = 10
    
    public init(title: String, action: @escaping () -> Void, isLoading: Binding<Bool>, backgroundColor: Color = .blue, foregroundColor: Color = .white, cornerRadius: CGFloat = 10) {
        self.title = title
        self.action = action
        self._isLoading = isLoading
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
    
    public var body: some View {
        Button(action: {
            if !isLoading {
                action()
            }
        }) {
            HStack {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                } else {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(foregroundColor)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
        }
        .disabled(isLoading)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            CustomButton(title: "Click Me", action: {}, isLoading: .constant(false))
            CustomButton(title: "Loading...", action: { }, isLoading: .constant(true), backgroundColor: .gray)
        }
        .padding()
    }
}
