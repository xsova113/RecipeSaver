//
//  EditRecipeView.swift
//  RecipeSaver
//
//  Created by George Chang on 2023-02-16.
//

import SwiftUI

struct EditRecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        Text(recipe.name)
    }
}

struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeView(recipe: Recipe(name: "", image: "", description: "", category: "", publishedDate: ""))
    }
}
