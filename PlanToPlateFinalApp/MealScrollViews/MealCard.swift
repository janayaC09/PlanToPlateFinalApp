import SwiftUI
struct MealCard: View {
    let title: String
    let imageName: String

    var body: some View {
        VStack(spacing: 12) {
            Text(title)
                .foregroundColor(.white)
                .font(.custom("InriaSans-Bold", size: 20))

            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}
