//
//  RecipeModel.swift
//  RecipeSaver
//
//  Created by George Chang on 2023-02-15.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    case breakfast = "Breakfast"
    case appetizer = "Appetizer"
    case soup = "Soup"
    case main = "Main"
    case side = "Side"
    case dessert = "Dessert"
    case drink = "Drink"
}

struct Recipe: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let category: Category.RawValue
    let publishedDate: String
}

extension Recipe {
    static let all: [Recipe] = [
        Recipe(name: "Laksa",
               image: "https://thericeandnoodle.com/images/dishes/food-photo-13.png",
               description: "Curry coconut chicken broth, rice noodle, broccoli, carrot, onion, tofu, cilantro, zucchini, bean sprouts, boiled egg",
               category: "Main",
               publishedDate: ""),
        Recipe(name: "Pad Thai",
               image: "https://thericeandnoodle.com/images/dishes/food-photo-1.png",
               description: "Rice noodle, egg, tofu, bean sprouts, green onion, crushed peanuts",
               category: "Main",
               publishedDate: ""),
        Recipe(name: "Thai Green Curry",
               image: "https://thericeandnoodle.com/images/dishes/food-photo-4.png",
               description: "Rice, green curry, basil, bok choy, carrot, broccoli, onion, red cabbage, red pepper",
               category: "Main",
               publishedDate: ""),
        Recipe(name: "Thai Coconut Soup",
               image: "https://thericeandnoodle.com/images/dishes/food-photo-10.png",
               description: "Coconut chicken broth, rice noodle, bean sprouts, carrot, broccoli, cilantro, onion, mushroom",
               category: "Soup",
               publishedDate: ""),
        Recipe(name: "Spring Roll",
               image: "https://thericeandnoodle.com/images/dishes/food-photo-springroll.png",
               description: "Deep fried vegetarian spring roll, 2 pcs",
               category: "Side",
               publishedDate: ""),
        Recipe(name: "Crispy Chicken",
               image: "https://thericeandnoodle.com/images/dishes/food-photo-chickenwing.png",
               description: "Lightly battered crispy chicken",
               category: "Side",
               publishedDate: ""),
        Recipe(name: "Coke",
               image: "https://www.coca-cola.ca/content/dam/journey/ca/en/private/brand-detail/diet-coke/thumbnail-diet-coke.png",
               description: "Coke from Coco-cola",
               category: "Drink",
               publishedDate: "")
    ]
}
