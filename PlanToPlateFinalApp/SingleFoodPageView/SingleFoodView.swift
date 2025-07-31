import SwiftUI

struct SingleFoodView: View {
    let food: FoodItem
    
    var body: some View {
        ZStack{
            BackgroundView()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    Image(food.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 250)
                        .clipped()
                        .cornerRadius(20)
                        .padding(.horizontal)
                        .padding(.top, 80)
                    
                    
                    Text(food.name)
                        .font(.custom("InriaSans-Bold", size: 30))
                        .padding(.horizontal).foregroundColor(.white)
                    
                    Text(food.description)
                        .font(.custom("InriaSans-Regular", size: 18))
                        .foregroundColor(.white)
                        .padding(.horizontal)
                    
                    Text("Calories: \(food.calories)")
                        .font(.custom("InriaSans-Bold", size: 20))
                        .padding(.horizontal).foregroundColor(.white)
                    
                    
                    
                    Link(destination: food.recipeURL) {
                        Text("View Full Recipe")
                            .font(.custom("InriaSans-Bold", size: 20))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.indigo)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding(.top)
            }
            .background(
                Image("Plan to Plate Background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
        }
    }
}
