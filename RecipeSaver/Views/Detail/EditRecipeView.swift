//
//  EditRecipeView.swift
//  RecipeSaver
//
//  Created by George Chang on 2023-02-16.
//

import SwiftUI

struct EditRecipeView: View {
    var recipe: Recipe

    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var directions: String = ""
    @State private var ingredients: String = ""
    @EnvironmentObject var recipesVM: RecipesViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Recipe Name", text: $name)
                } header: {
                    Text("Name")
                }
                
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.wheel)
                } header: {
                    Text("Category")
                }
                
                Section {
                    TextEditor(text: $description)
                } header: {
                    Text("Description")
                }
                
                Section {
                    TextEditor(text: $ingredients)
                } header: {
                    Text("Ingredients")
                }
                
                Section {
                    TextEditor(text: $directions)
                } header: {
                    Text("Directions")
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // save changes...
                        dismiss()
                    } label: {
                        Label("Done", systemImage: "checkmark")
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle(recipe.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        EditRecipeView(recipe: Recipe(name: "", image: "", description: "", category: "", publishedDate: ""))
    }
}
