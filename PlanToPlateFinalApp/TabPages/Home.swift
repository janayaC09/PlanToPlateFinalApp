import SwiftUI

struct Home: View {
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.systemIndigo

            // Unselected = White
            appearance.stackedLayoutAppearance.normal.iconColor = .white
            appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
            
            // Selected = Gray
            appearance.stackedLayoutAppearance.selected.iconColor = .cyan
            appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
                .foregroundColor: UIColor.cyan
            ]

            // Apply appearance
            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }

    var body: some View {
        ZStack {
            // Background image
            BackgroundView()
                
                TabView{
                    HomePageScroll()
                        .tabItem{
                            Image(systemName: "house")
                            Text("Home")
                        }
                    WeeklyScheduleView()
                        .tabItem{
                            Image(systemName: "calendar")
                            Text("Schedule")
                        }
                    Saved()
                        .tabItem{
                            Image(systemName: "heart")
                            Text("Saved")
                        }
                    Pantry()
                        .tabItem{
                            Image(systemName: "book.fill")
                            Text("Pantry")
                        }
                    Tracker()
                        .tabItem{
                            Image(systemName: "pencil")
                            Text("Tracker")
                        }
                }
                
                
                
                
            }
        }
    }
    

#Preview {
    Home()
}
