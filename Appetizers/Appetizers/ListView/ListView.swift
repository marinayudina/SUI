//
//  ListView.swift
//  Appetizers
//
//  Created by Марина on 31.10.2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = ListViewModel() //use state object because we initialize
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                List(viewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
//                        .listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
                
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetailView) //disable scrolling view when argument is true
                .listStyle(.plain)
            }
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            .task {
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            if viewModel.isShowingDetailView {
                DetailView(appetizer: viewModel.selectedAppetizer ?? Mockdata.simpleAppetizer,
                           isShowingDetailView: $viewModel.isShowingDetailView)
            }
            if viewModel.isLoading {
                LoadingView()
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
        
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
