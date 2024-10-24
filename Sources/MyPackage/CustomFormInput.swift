import SwiftUI

/// A customizable form input field that can be reused across different views.
///
/// - Parameters:
///   - label: The label displayed above the input field.
///   - text: A binding to the text value being edited.
///   - placeholder: The placeholder text for the input field. Default is an empty string.
///   - errorMessage: An optional error message displayed below the input field.
///   - keyboardType: The type of keyboard to use for the text field. Default is `.default`.
public struct CustomFormInput: View {
    public var label: String
    @Binding public var text: String
    public var placeholder: String = ""
    public var errorMessage: String?
    public var keyboardType: UIKeyboardType = .default
    
    public init(label: String, text: Binding<String>, placeholder: String = "", errorMessage: String? = nil, keyboardType: UIKeyboardType = .default) {
        self.label = label
        self._text = text
        self.placeholder = placeholder
        self.errorMessage = errorMessage
        self.keyboardType = keyboardType
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .keyboardType(keyboardType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, errorMessage == nil ? 0 : 5)
            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

struct CustomFormInput_Previews: PreviewProvider {
    @State static var textValue = ""
    static var previews: some View {
        VStack(spacing: 20) {
            CustomFormInput(label: "Username", text: $textValue, placeholder: "Enter your username", errorMessage: "Username is required")
            CustomFormInput(label: "Email", text: $textValue, placeholder: "Enter your email", keyboardType: .emailAddress)
        }
        .padding()
    }
}
