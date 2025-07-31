import SwiftUI

struct HomePageScroll: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    let foodItems: [FoodItem] = [
            FoodItem(
                name: "Kimchi Rice Bowl",
                imageName: "kimchiRice",
                description: "Spicy and savory Korean rice dish mixed with kimchi and a egg.",
                calories: 560,
                recipeURL: URL(string: "https://www.foodnetwork.com/recipes/food-network-kitchen/egg-and-kimchi-rice-bowls-3362797")!
            ),
            FoodItem(
                name: "Spaghetti",
                imageName: "spaghetti",
                description: "Simple and classic Italian pasta with homemade tomato sauce and cheese!",
                calories: 497,
                recipeURL: URL(string: "https://www.foodnetwork.com/recipes/food-network-kitchen/one-pot-spaghetti-with-fresh-tomato-sauce-3364201")!
            ),
            FoodItem(
                name: "Mac & Cheese",
                imageName: "mac&chees",
                description: "Homemade easy stovetop mac & cheese recipe!",
                calories: 376,
                recipeURL: URL(string: "https://www.foodnetwork.com/recipes/food-network-kitchen/classic-stovetop-macaroni-and-cheese-3562195")!
            ),
            FoodItem(
                name: "Steak",
                imageName: "steak",
                description: "Delicious steak and potatoes bowl recipe. Have your veggies and protein all in one meal!",
                calories: 556,
                recipeURL: URL(string: "https://dizzybusyandhungry.com/steak-and-potato-salad/")!
            ),
            FoodItem(
                name: "Teriyaki Chicken",
                imageName: "TeriyakiChicken",
                description: "Sweet teriyaki chicken that takes less than 30 minutes! This is the best teriyaki chicken recipe that tastes like you got it from a Japanese restaurant.",
                calories: 321,
                recipeURL: URL(string: "https://downshiftology.com/recipes/teriyaki-chicken/")!
            ),
            FoodItem(
                name: "Mexican Casserole",
                imageName: "mexicancasserole",
                description: "Great for low-carb diets, this Mexican Casserole is a hearty and flavorful meal that is sure to please!",
                calories: 250,
                recipeURL: URL(string: "https://laurenkellynutrition.com/healthy-mexican-casserole/")!
            )
        ]

    var body: some View {
        ZStack {
            BackgroundView()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    
                    HStack {
                        Image("profile")
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding(.leading, 20)
                            .padding(.top, 30)
                        Spacer()
                    }
                    
                    Text("What are you eating today?")
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.custom("InriaSans-Bold", size: 35))
                        .padding(.top, 30)
                        .padding(.bottom, 40)
                        .frame(maxWidth: .infinity)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 40) {
                            NavigationLink(destination: SingleFoodView(food: FoodItem(
                                name: "Avocado Toast",
                                imageName: "breakfast-placeholder",
                                description: "Start your day right with a nutritious breakfast. Delicious avocado toast with poached eggs.",
                                calories: 300,
                                recipeURL: URL(string: "https://cookieandkate.com/avocado-toast-recipe/")!
                            ))) {
                                MealCard(title: "Breakfast", imageName: "breakfast-placeholder")
                            }
                            
                            NavigationLink(destination: SingleFoodView(food: FoodItem(
                                name: "Cobb Salad",
                                imageName: "lunch-placeholder",
                                description: "A hearty midday meal to keep you going. A Cobb Salad is both nutritious and filling!",
                                calories: 500,
                                recipeURL: URL(string: "https://www.allrecipes.com/recipe/14415/cobb-salad/")!
                            ))) {
                                MealCard(title: "Lunch", imageName: "lunch-placeholder")
                            }
                            
                            NavigationLink(destination: SingleFoodView(food: FoodItem(
                                name: "Dinner",
                                imageName: "dinner-placeholder",
                                description: "Wind down with a balanced dinner. With both protein and nutrients, this dinner is the perfect meal for your evening!",
                                calories: 600,
                                recipeURL: URL(string: "https://natashaskitchen.com/pan-seared-steak/")!
                            ))) {
                                MealCard(title: "Dinner", imageName: "dinner-placeholder")
                            }
                            
                            NavigationLink(destination: SingleFoodView(food: FoodItem(
                                name: "Yogurt Parfait",
                                imageName: "snack-placeholder",
                                description: "Quick energy between meals. This parfait is packed with protein and nutrients!",
                                calories: 150,
                                recipeURL: URL(string: "https://www.allrecipes.com/recipe/37095/yogurt-parfait/")!
                            ))) {
                                MealCard(title: "Snack", imageName: "snack-placeholder")
                            }
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
                        ForEach(foodItems) { food in
                            NavigationLink(destination: SingleFoodView(food: food)
                                .navigationBarBackButtonHidden(false)) {
                                    IdeaCard(imageName: food.imageName, title: food.name)
                                }
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                    
                    Spacer(minLength: 80) // Space before tab bar
                }
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

#Preview {
        HomePageScroll()
    
}
