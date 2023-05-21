//
//  TransactionsView.swift
//  airgead
//
//  Created by Jonathan Copeland on 21/05/2023.
//

import SwiftUI

struct TransactionsView: View {
    
    @ObservedObject var transactions: Transactions

    
    var body: some View {
        ForEach(transactions.items) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text("\(item.category), \(item.payee)")
                    Text("1:12pm")
                        .font(.caption)
                }
                
                Spacer()

                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            }
            
        }
    }
}

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(transactions: Transactions())
    }
}
