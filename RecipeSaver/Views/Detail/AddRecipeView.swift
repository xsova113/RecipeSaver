//
//  AddRecipeView.swift
//  RecipeSaver
//
//  Created by George Chang on 2023-02-15.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var directions: String = ""
    @State private var ingredients: String = ""
    @State private var navigateToRecipe = false
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
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        navigateToRecipe = true
                        saveRecipe()
                    } label: {
                        Label("Done", systemImage: "checkmark")
                    }
                    .disabled(name.isEmpty)
                }
            })
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $navigateToRecipe) {
                RecipeView(recipe: recipesVM.recipes.sorted { $0.publishedDate > $1.publishedDate }[0])
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

extension AddRecipeView {
    private func saveRecipe() {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        
        let datePublished = dateFormatter.string(from: now)
        print(datePublished)
        let newRecipe = Recipe(name: name, image: "", description: description, category: selectedCategory.rawValue, publishedDate: datePublished)
        recipesVM.addRecipe(recipe: newRecipe)
    }
}

extension AddRecipeView {
    private func deleteRecipe() {
        
    }
}


struct AddRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        AddRecipeView()
            .environmentObject(RecipesViewModel())
    }
}

