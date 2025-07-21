import SwiftUI

struct Home: View {
    @State private var selectedTab: tab = .home

    var body: some View {
        ZStack {
            // Background image
            Image("Plan to Plate Background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                ZStack {
                    switch selectedTab {
                    case .home:
                        HomePageScroll()
                        
                    case .schedule:
                            WeeklyScheduleView()
                       
                    case .saved:
                        Text("Saved Page")
                            .font(.largeTitle)
                            .foregroundColor(.white)

                    case .pantry:
                        Text("Pantry Scanner")
                            .font(.largeTitle)
                            .foregroundColor(.white)

                    case .tracker:
                        Text("Tracker Page")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                // Floating Custom Tab Bar
                TabBar(selectedTab: $selectedTab)
                    .padding(.bottom, 25)
            }
        }
    }
}

#Preview {
    Home()
}
