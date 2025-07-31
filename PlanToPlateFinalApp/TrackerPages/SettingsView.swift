import SwiftUI

struct SettingsView: View {
    var resetAll: () -> Void
    var logMissedMeal: (_ date: Date, _ types: Set<MealType>) -> Void
    var showMonthly: Bool

    @State private var selectedMeals: Set<MealType> = []
    @State private var selectedDate = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Reset")) {
                    Button("Reset Meal Log", action: resetAll)
                        .foregroundColor(.red)
                }

                Section(header: Text("Log Missed Meals")) {
                    DatePicker("Select Date", selection: $selectedDate, in: allowedDateRange(), displayedComponents: .date)

                    ForEach(MealType.allCases, id: \.self) { meal in
                        Toggle(meal.rawValue.capitalized, isOn: Binding(
                            get: { selectedMeals.contains(meal) },
                            set: { selected in
                                if selected {
                                    selectedMeals.insert(meal)
                                } else {
                                    selectedMeals.remove(meal)
                                }
                            }
                        ))
                    }

                    Button("Log Missed Meals") {
                        logMissedMeal(selectedDate, selectedMeals)
                        selectedMeals.removeAll()
                    }

                    Button("Clear Selection") {
                        selectedMeals.removeAll()
                    }
                    .foregroundColor(.gray)
                }
            }
            .navigationTitle("Settings")
        }
    }

    func allowedDateRange() -> ClosedRange<Date> {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())

        if showMonthly {
            let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today))!
            return startOfMonth...today
        } else {
            let startOfWeek = calendar.date(byAdding: .day, value: -6, to: today)!
            return startOfWeek...today
        }
    }
}
