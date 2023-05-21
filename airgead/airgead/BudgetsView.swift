//
//  BudgetsView.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import SwiftUI

struct BudgetsView: View {
    
    @ObservedObject var budgets: Budgets

    
    var body: some View {
        ForEach(budgets.items) { item in
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text("Spent: $0")
                    }
                    Spacer()
                    Text("$324")
                    
                }
                Text("Ends in 6 days")
            }

            
        }
    }
}

struct BudgetsView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetsView(budgets: Budgets())
    }
}
