/// Sending the second phase to the `content` closure using a SwiftUI ViewModifier.
struct PhaseTwoModifier: ViewModifier {
    let phaseData: SomeDataType

    func body(content: Content) -> some View {
        content
            .background(
                /// Here, we are sending the second phase (phaseData) to the `content` closure
                /// using a background view that depends on the phase data.
                PhaseTwoView(data: phaseData)
            )
    }
}

struct PhaseTwoView: View {
    let data: SomeDataType

    var body: some View {
        // Render UI elements based on the second phase's data
        Text("Phase Two Data: \(data)")
    }
}

extension View {
    func applyPhaseTwo(data: SomeDataType) -> some View {
        self.modifier(PhaseTwoModifier(phaseData: data))
    }
}

// Usage in a SwiftUI View
struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .applyPhaseTwo(data: somePhaseTwoData)
    }
}
