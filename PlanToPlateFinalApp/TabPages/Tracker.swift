import SwiftUI

struct Tracker: View {

    @State private var showConfetti: Bool = false
    @State private var showSettings: Bool = false
    @State private var showMonthly: Bool = false

    @State private var personalGoal: String = ""
    @State private var editingGoal: Bool = false
    @State private var tempGoal: String = ""

    @StateObject private var mealLog = MealLog()

    var body: some View {
        NavigationView {
            ZStack {
                Image("Plan to Plate Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {

                        HStack {
                            Spacer()
                            
                            Button {
                                showSettings = true
                            } label: {
                                Image(systemName: "gearshape.fill")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                    .padding(.top, 30).padding(.horizontal, 10)
                            }
                        }
                        .padding(.horizontal)
                        Text("Badges")
                            .foregroundColor(.white)
                            .font(.custom("InriaSans-Bold", size: 40))
                            .padding(.horizontal)

                        
                        Toggle("Show Monthly Progress", isOn: $showMonthly)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(MealType.allCases, id: \.self) { meal in
                                    let progress = showMonthly
                                        ? mealLog.monthlyProgress(for: meal)
                                        : mealLog.weeklyProgress(for: meal)

                                    trackerView(
                                        imageName: meal.rawValue,
                                        title: meal.rawValue.capitalized,
                                        progress: progress,
                                        mealType: meal
                                    )
                                }
                            }
                            .padding(.horizontal)
                        }

                        personalGoalsSection()
                
                    }
                }

                if showConfetti {
                    ConfettiView()
                        .transition(.opacity)
                        .zIndex(1)
                }
            }
            .sheet(isPresented: $showSettings) {
                SettingsView(
                    resetAll: resetMealLog,
                    logMissedMeal: logMissedMeal,
                    showMonthly: showMonthly
                )
            }
            .sheet(isPresented: $editingGoal) {
                VStack {
                    Text("Edit Personal Goal")
                        .font(.headline)
                        .padding()

                    TextField("Enter your goal", text: $tempGoal)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    Button("Save") {
                        personalGoal = tempGoal
                        editingGoal = false
                    }
                    .padding()

                    Button("Cancel") {
                        editingGoal = false
                    }
                    .foregroundColor(.red)
                }
            }
        }
    }

    func trackerView(imageName: String, title: String, progress: Double, mealType: MealType) -> some View {
        VStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 2))

            Text(title)
                .foregroundColor(.white)
                .font(.caption.bold())

            ProgressView(value: progress)
                .progressViewStyle(
                    LinearProgressViewStyle(
                        tint: progress >= 1.0 ? .green : .blue
                    )
                )
                .frame(width: 100, height: 12)
                .background(Color.white.opacity(0.2))
                .cornerRadius(6)

            if progress < 1.0 {
                Button("Complete") {
                    mealLog.logToday([mealType])
                    triggerConfetti()
                }
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.white.opacity(0.2))
                .foregroundColor(.white)
                .cornerRadius(8)
                .font(.caption.bold())
            } else {
                Text("✓ Done")
                    .font(.caption.bold())
                    .foregroundColor(.green)
            }

            Text("\(Int(progress * 100))%")
                .font(.caption2)
                .foregroundColor(.white)
        }
        .frame(height: 350, alignment: .top)
    }

    func personalGoalsSection() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Personal Goals")
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .font(.custom("InriaSans-Bold", size: 40))
                .padding(.horizontal)

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white.opacity(0.5), lineWidth: 2)
                    .background(Color.white.opacity(0.1))
                    .frame(height: 100)

                Text(personalGoal.isEmpty ? "No goal set." : personalGoal)
                    .foregroundColor(.white)
                    .padding()
            }
            .padding(.horizontal)

            HStack {
                Button("Add Goal") {
                    tempGoal = personalGoal
                    editingGoal = true
                }
                .foregroundColor(.white.opacity(0.8))
                .font(.caption)
                .opacity(personalGoal.isEmpty ? 1 : 0)

                Spacer()

                Button("Change Goal") {
                    tempGoal = personalGoal
                    editingGoal = true
                }
                .foregroundColor(.white.opacity(0.8))
                .font(.caption)
                .opacity(personalGoal.isEmpty ? 0 : 1)
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }

    func resetMealLog() {
        withAnimation { mealLog.resetAll() }
    }

    func logMissedMeal(for date: Date, _ meals: Set<MealType>) {
        withAnimation {
            mealLog.log(date: date, meals: meals)
            triggerConfetti()
        }
    }

    func triggerConfetti() {
        withAnimation { showConfetti = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation { showConfetti = false }
        }
    }
    
}
#Preview{
    Tracker()
}
