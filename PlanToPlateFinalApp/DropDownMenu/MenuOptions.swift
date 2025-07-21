
//
//  DropdownMenuOption.swift
//  DropdownMenu
//
//

import Foundation

struct MenuOptions: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}

extension MenuOptions {
    static let testSingleOption: MenuOptions = MenuOptions(option: "None")
    static let testAllOptions: [MenuOptions] = [
        MenuOptions(option: "Vegetarian"),
        MenuOptions(option: "Vegan"),
        MenuOptions(option: "Low-Calorie"),
        MenuOptions(option: "Gluten-Free"),
        MenuOptions(option: "None"),
        MenuOptions(option: "Diabetic")
        ]
        static let testAllOptionsA: [MenuOptions] = [
            MenuOptions(option: "Dairy"),
            MenuOptions(option: "Nuts"),
            MenuOptions(option: "Fish"),
            MenuOptions(option: "Soy"),
            MenuOptions(option: "Wheat"),
            MenuOptions(option: "None"),
        ]
}

        
