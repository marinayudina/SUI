//
//  OrderView.swift
//  Appetizers
//
//  Created by Марина on 31.10.2023.
//

import SwiftUI

struct OrderView: View {
    
//    @State private var orderItems = Mockdata.orderItems
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            ZStack{
          
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItem)
                    }
                    .listStyle(.plain)
                    
                    
                    Button {
                        print("place order")
                    } label: {
                        AddButton(title: "Place Order",
                                  appetizerPrice: order.totalPrice)
                            
                    }
                    .padding(.bottom, 20)
                }
                if order.items.isEmpty {
                    EmptyState()
                }
            }
            .navigationTitle("Orders")
          
            
        }
        
    }
    

}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
