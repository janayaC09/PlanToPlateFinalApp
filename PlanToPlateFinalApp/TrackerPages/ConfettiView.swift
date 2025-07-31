import SwiftUI

struct ConfettiView: View {
    func randomColor() -> Color {
        [Color.red, Color.blue, Color.green, Color.orange, Color.purple, Color.yellow].randomElement()!
    }

    var body: some View {
        ZStack {
            ForEach(0..<50, id: \.self) { _ in
                Circle()
                    .fill(randomColor())
                    .frame(width: 8, height: 8)
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(0.7)
            }
        }
        .allowsHitTesting(false)
    }
}
