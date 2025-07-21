import SwiftUI

struct HomePageScroll: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                
                // Profile at top left
                HStack {
                    Image("profile")
                        .resizable()
                        .frame(width: 70, height: 70)
                        .clipShape(Circle())
                        .padding(.leading, 20)
                        .padding(.top, 20)
                    Spacer()
                }

                // Header
                Text("What are you eating today?")
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .font(.custom("InriaSans-Bold", size: 35))
                    .padding(.top, 30)
                    .padding(.bottom, 40)
                    .frame(maxWidth: .infinity)

                // Horizontal scroll for meals
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 40) {
                        MealCard(title: "Breakfast", imageName: "breakfast-placeholder")
                        MealCard(title: "Lunch", imageName: "lunch-placeholder")
                        MealCard(title: "Dinner", imageName: "dinner-placeholder")
                        MealCard(title: "Snack", imageName: "snack-placeholder")
                    }
                    .padding(.horizontal)
                }
                .frame(height: 160)
                .mask(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: .clear, location: 0),
                            .init(color: .white, location: 0.1),
                            .init(color: .white, location: 0.9),
                            .init(color: .clear, location: 1)
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )

                // Ideas title
                Text("Ideas")
                    .font(.custom("InriaSans-Bold", size: 40))
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    .padding(.top, 90)
                    .frame(maxWidth: .infinity, alignment: .leading)

                // Ideas Grid
                LazyVGrid(columns: columns, spacing: 80) {
                    IdeaCard(imageName: "idea1-placeholder", title: "Steak")
                    IdeaCard(imageName: "idea2-placeholder", title: "Pasta")
                    IdeaCard(imageName: "kimchiRice", title: "Kimchi Rice")
                    IdeaCard(imageName: "spaghetti", title: "Spaghetti")
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

                Spacer(minLength: 80) // Space before tab bar
            }
        }
    }
}

struct IdeaCard: View {
    let imageName: String
    let title: String

    var body: some View {
        VStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            Text(title)
                .foregroundColor(.white)
                .font(.custom("InriaSans-Bold", size: 18))
                .multilineTextAlignment(.center)
        }
    }
}



#Preview{
    HomePageScroll()
}
