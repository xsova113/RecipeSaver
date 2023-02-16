//
//  ContentView.swift
//  RecipeSaver
//
//  Created by George Chang on 2023-02-15.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    var body: some View {
        TabBar()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipesViewModel())
    }
}
