//
//  MealFetchRepository.swift
//  Fetch home assignment
//
//  Created by Ismatulla Mansurov on 11/8/23.
//

import Foundation

class MealFetchRepository {
	
	func getMealList(completion: @escaping ([Meal]) -> ()) {
		guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return }
		
		URLSession.shared.dataTask(with: url) { (data, _, _) in
			let meals = try? JSONDecoder().decode(MealList.self, from: data ?? Data())
			DispatchQueue.main.async {
				completion(meals?.meals.sorted() ?? [])
			}
		}.resume()
	}
	
	func getMealDetail(id: String, completion: @escaping (MealInfo) -> ()) {
		guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else { return }
		
		URLSession.shared.dataTask(with: url) { (data, response, error) in
			if let error = error {
				print("Error fetching meal details: \(error)")
				return
			}
			
			guard let data = data else {
				print("No data received from the API")
				return
			}
			
			do {
				let mealDetails = try JSONDecoder().decode(MealInfo.self, from: data)
				DispatchQueue.main.async {
					completion(mealDetails)
				}
			} catch {
				print("Decoding error: \(error)")
			}
		}.resume()
	}
}
