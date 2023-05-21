//
//  ContentView.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var transactions = Transactions()
    @StateObject var budgets = Budgets()
    
    @State private var showingAddTransaction = false
    @State private var showingAddBudget = false


    
    var body: some View {
        TabView() {
            
            NavigationView {
                List {
                    BudgetsView(budgets: budgets)
                }
                .navigationTitle("Budgets")
                .toolbar {
                    Button {
                        showingAddBudget = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddBudget) {
                    AddBudgetView(budgets: budgets)
                }
            }
            .tabItem
            {
                Text("Budgets")
                
            }
            .tag(1)
            
            
            
            NavigationView {
                List {
                    TransactionsView(transactions: transactions)
                }
                .navigationTitle("Transactions")
                .toolbar {
                    Button {
                        showingAddTransaction = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddTransaction) {
                    AddView(transactions: transactions)
                }
            }
                .tabItem
            {
                Text("Transactions")
                
            }
            .tag(2)
            
        }
        

        
        
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
