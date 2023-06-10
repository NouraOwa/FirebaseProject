//
//  MainView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import SwiftUI
import Firebase

struct MainView: View {
    @ObservedObject private var viewModel = RestaurantsViewModel()
    @State private var searchText = ""
    @State private var showModal = false
    @State var isLoading = false
    @State private var showingAlert = false
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack{
                    if isLoading{
                        ProgressView()
                    }
                    Button(action: {
                        self.showModal = true
                    }) {
                        HStack {
                            Image(systemName: "plus")
                                .padding(.leading,300)
                            Button() {
                                isLoading = true
                                showingAlert = true
                            } label: {
                                Label("", systemImage: "arrow.counterclockwise")
                                    .foregroundColor(Color(.black))
                            }.alert("Your Data is up to Date", isPresented: $showingAlert) {
                                Button("OK", role: .cancel) {
                                    isLoading = false
                                }
                            }
                        }
                    }
                    .sheet(isPresented: self.$showModal, onDismiss: {  }) {
                        NewRestaurantView(showModal: self.$showModal)
                        // })
                            .navigationBarTitle(Text("Add New"), displayMode: .inline)
                    }
                    MVVMRestaurantView()
                    List() {
                        ForEach(viewModel.restaurant) { restaurant in
                            HStack() {
                                Text(restaurant.itemName ?? "")
                                    .font(.title3)
                                Text(restaurant.itemPrice ?? "")
                                    .font(.title3).bold()
                            }
                        }
                    }.onAppear() {
                        self.viewModel.fetchData()
                    }
                }
            }
        }
    }
    
}
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
