import SwiftUI

struct WeeklyScheduleView: View {
    let daysOfWeek = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    let meals = [
        ("Breakfast", "breakfast-placeholder"),
        ("Lunch", "lunch-placeholder"),
        ("Dinner", "dinner-placeholder"),
        ("Snack", "snack-placeholder")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Your Meal Plan")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(.custom("InriaSans-Bold", size: 35))
                .padding(.top, 30)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(daysOfWeek, id: \.self) { day in
                        DayScheduleView(day: day, meals: meals)
                    }
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

struct DayScheduleView: View {
    let day: String
    let meals: [(String, String)]

    var body: some View {
        VStack(spacing: 5) {
            Text(day)
                .font(.custom("InriaSans-Bold", size: 24))
                .foregroundColor(.white)
                .padding(.bottom, 10)

            ForEach(meals, id: \.0) { meal in
                VStack(alignment: .leading, spacing: 8) {
                    Text(meal.0)
                        .font(.custom("InriaSans-Bold", size: 18))
                        .foregroundColor(.white)

                    Image(meal.1)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }
            }

            //Spacer()
        }
        //.padding()
        .frame(width: 350,height: 600)
        .background(Color.cyan.opacity(0.9))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
#Preview{
    WeeklyScheduleView()
}
