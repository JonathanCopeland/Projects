//
//  CategoriesView.swift
//  SwiftyWords
//
//  Created by Jonathan Copeland on 22/04/2023.
//

import SwiftUI

struct CategoriesView: View {
    
    var categories = Bundle.main.decode([String].self, from: "Categories.json").map {
        Bundle.main.decode(Category.self, from: "\($0).json")
    }
    
    var body: some View {
        NavigationStack {
            List(categories) { category in
                NavigationLink(value: category) {
                    VStack(alignment: .leading) {
                        Text(category.name)
                            .font(.headline)
                        
                        Text(category.description)
                    }
                }
            }
            .navigationDestination(for: Category.self) { category in
                LevelsView(category: category)
            }
            .navigationTitle("7 Swift Words")
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
