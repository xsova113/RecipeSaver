//
//  RecipeList.swift
//  RecipeSaver
//
//  Created by George Chang on 2023-02-15.
//

import SwiftUI

struct RecipeList: View {
    @State var recipes: [Recipe]
    
    @State private var isEditing = false
    @State private var isEditingDetail = false
    
    var body: some View {
        
        VStack {
            HStack {
                Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                    .font(.headline)
                    .fontWeight(.medium)
                    .opacity(0.7)
                
                Spacer()
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                
                ForEach(recipes) { recipe in
                    
                    if isEditing {
                        Button {
                            guard let index = recipes.firstIndex(of: recipe) else { return }
                            withAnimation {
                                _ = recipes.remove(at: index)
                            }
                        } label: {
                            Image(systemName: "xmark.square.fill")
                                .font(.title)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, Color.red)
                        }
                    }
                    
                    NavigationLink {
                        RecipeView(recipe: recipe)
                    } label: {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation {
                        isEditing.toggle()
                    }
                }
            }
        }
    }
}


struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.all)
        }
    }
}

