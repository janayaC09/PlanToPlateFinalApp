import Foundation

struct MealEntry: Codable {
    let date: Date
    let type: MealType
}

class MealLog: ObservableObject {
    @Published private(set) var entries: [MealEntry] = []

    func logToday(_ types: [MealType]) {
        let today = Calendar.current.startOfDay(for: Date())
        for type in types {
            if !entries.contains(where: { $0.date == today && $0.type == type }) {
                entries.append(MealEntry(date: today, type: type))
            }
        }
    }

    func log(date: Date, meals: Set<MealType>) {
        let selectedDay = Calendar.current.startOfDay(for: date)
        for type in meals {
            if !entries.contains(where: { $0.date == selectedDay && $0.type == type }) {
                entries.append(MealEntry(date: selectedDay, type: type))
            }
        }
    }

    func resetAll() {
        entries.removeAll()
    }

    func weeklyProgress(for type: MealType) -> Double {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let startOfWeek = calendar.date(byAdding: .day, value: -6, to: today)!
        let matching = entries.filter { $0.type == type && $0.date >= startOfWeek && $0.date <= today }
        return Double(matching.count) / 7.0
    }

    func monthlyProgress(for type: MealType) -> Double {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        guard let startOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: today)) else { return 0.0 }
        let matching = entries.filter { $0.type == type && $0.date >= startOfMonth && $0.date <= today }
        let days = calendar.component(.day, from: today)
        return Double(matching.count) / Double(days)
    }
}
