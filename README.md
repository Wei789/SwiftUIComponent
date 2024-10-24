# MyPackage Swift Package

This package provides customizable components for SwiftUI, including a customizable button (`CustomButton`), a loading screen (`LoadingScreen`), and a form input field (`CustomFormInput`).

## Features
- **Customizable Button (`CustomButton`)**:
  - Customizable text, colors, and corner radius.
  - Loading state to indicate ongoing actions.
  - Easy to integrate and reuse across different views.
- **Loading Screen (`LoadingScreen`)**:
  - Customizable background color, spinner size, and spinner color.
  - Ability to use a custom loading spinner view.
  - Bindable loading state for visibility control.
- **Customizable Form Input (`CustomFormInput`)**:
  - Customizable label, placeholder, and error message.
  - Supports different keyboard types.
  - Easy to integrate and reuse across different views.

## Installation
Add the package via **Swift Package Manager**.

1. In Xcode, select **File > Add Packages**.
2. Enter the repository URL of the package.
3. Add the package to your project.

## Usage
### Custom Button (`CustomButton`)
Import the package and use `CustomButton` in your SwiftUI views.

```swift
import MyPackage

struct ContentView: View {
    @State private var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            CustomButton(title: "Click Me", action: {
                print("Button Clicked")
            }, isLoading: $isLoading)
            CustomButton(title: "Loading...", action: { }, isLoading: .constant(true), backgroundColor: .gray)
        }
        .padding()
    }
}
```

### Loading Screen (`LoadingScreen`)
Import the package and use `LoadingScreen` in your SwiftUI views to indicate loading states.

```swift
import MyPackage

struct LoadingExampleView: View {
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            LoadingScreen(isLoading: $isLoading, spinnerSize: 60, spinnerColor: .red, backgroundColor: Color.black.opacity(0.3), customSpinner: {
                Image(systemName: "hourglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
            })
            Button("Toggle Loading") {
                isLoading.toggle()
            }
        }
        .padding()
    }
}
```

### Custom Form Input (`CustomFormInput`)
Import the package and use `CustomFormInput` in your SwiftUI views.

```swift
import MyPackage

struct ContentView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            CustomFormInput(label: "Username", text: $username, placeholder: "Enter your username", errorMessage: username.isEmpty ? "Username is required" : nil)
            CustomFormInput(label: "Email", text: $email, placeholder: "Enter your email", keyboardType: .emailAddress)
        }
        .padding()
    }
}
```

## Parameters
### Custom Button (`CustomButton`)
- **`title`**: The text displayed on the button when not in loading state.
- **`action`**: The closure executed when the button is pressed.
- **`isLoading`**: A binding to a Boolean value that indicates whether the button is in a loading state. Default is `false`.
- **`backgroundColor`**: The background color of the button. Default is `.blue`.
- **`foregroundColor`**: The text color of the button. Default is `.white`.
- **`cornerRadius`**: The corner radius of the button. Default is `10`.

### Loading Screen (`LoadingScreen`)
- **`isLoading`**: A binding to a Boolean value that indicates whether the loading screen should be visible.
- **`backgroundColor`**: The background color of the loading screen. Default is `.black.opacity(0.5)`.
- **`spinnerSize`**: The size of the loading spinner. Default is `50`.
- **`spinnerColor`**: The color of the loading spinner. Default is `.white`.
- **`customSpinner`**: A custom spinner view to use instead of the default `ProgressView`.

### Custom Form Input (`CustomFormInput`)
- **`label`**: The label displayed above the input field.
- **`text`**: A binding to the text value being edited.
- **`placeholder`**: The placeholder text for the input field. Default is an empty string.
- **`errorMessage`**: An optional error message displayed below the input field.
- **`keyboardType`**: The type of keyboard to use for the text field. Default is `.default`.

## Example
The following examples show how to use `CustomButton`, `LoadingScreen`, and `CustomFormInput` in simple SwiftUI views:

```swift
import SwiftUI
import MyPackage

struct ExampleView: View {
    @State private var isLoading = false
    @State private var textValue = ""
    
    var body: some View {
        VStack(spacing: 20) {
            CustomButton(title: "Submit", action: {
                print("Submit Button Pressed")
            }, isLoading: $isLoading, backgroundColor: .green, cornerRadius: 12)
            
            LoadingScreen(isLoading: $isLoading, spinnerSize: 60, spinnerColor: .red, backgroundColor: Color.black.opacity(0.3), customSpinner: {
                Image(systemName: "hourglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
            })
            Button("Toggle Loading") {
                isLoading.toggle()
            }
            
            CustomFormInput(label: "Username", text: $textValue, placeholder: "Enter your username", errorMessage: "Username is required")
            CustomFormInput(label: "Email", text: $textValue, placeholder: "Enter your email", keyboardType: .emailAddress)
        }
        .padding()
    }
}
```

## License
This package is available under the **MIT license**. See the LICENSE file for more information.
