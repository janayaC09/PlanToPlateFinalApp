//
//  FoodItem.swift
//  PlanToPlateFinalApp
//
//  Created by DPI Student 148 on 7/22/25.
//

import Foundation

struct FoodItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let description: String
    let calories: Int
    let recipeURL: URL
}


