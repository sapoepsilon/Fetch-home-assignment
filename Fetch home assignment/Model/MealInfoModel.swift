//
//  MealInfoModel.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import Foundation

struct MealInfo: Codable {
	let meals: [[String: String?]]
	var strMealThumb: String {
		(meals.first?["strMealThumb"] ?? "") ?? ""
	}
	
	var strMeal: String {
		meals.first?["strMeal"]?.flatMap { $0 } ?? ""
	}
	
	var strInstructions: String {
		meals.first?["strInstructions"]?.flatMap { $0 }  ?? ""
	}
	
	var idMeal: String {
		meals.first?["idMeal"]?.flatMap { $0 }  ?? ""
	}
	
	var ingredients: [String: String] {
		var ingredientsDict = [String: String]()
		
		meals.forEach { meal in
			meal.forEach { key, value in
				if let value = value, !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
					// Check if the key is for an ingredient or a measurement
					if key.hasPrefix("strIngredient") {
						let index = key.dropFirst("strIngredient".count)
						let measureKey = "strMeasure\(index)"
						if let measure = meal[measureKey] ?? nil {
							ingredientsDict[value] = measure
						}
					}
				}
			}
		}
		
		return ingredientsDict
	}
}
