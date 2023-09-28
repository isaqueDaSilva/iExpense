//
//  ListView.swift
//  iExpense
//
//  Created by Isaque da Silva on 27/09/23.
//

import SwiftUI

struct ListView: View {
    var title: String
    var description: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(description)
                .foregroundColor(.gray)
        }
    }
}
