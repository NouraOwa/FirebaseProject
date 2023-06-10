//
//  MVVMRestaurantView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import SwiftUI

struct MVVMRestaurantView: View {
    @ObservedObject var viewModel = RestaurantsViewModel()
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            VStack{
                HeaderView()
                Text("List for Food & Beverage")
                    .padding(.trailing,150)
                    .bold()
                    .padding(.top)
                ForEach(viewModel.restaurant) { item in
                    ZStack(alignment: .leading){
                        Rectangle()
                            .frame(width: 350,height: 100)
                            .foregroundColor(Color.gray.opacity(0.1))
                            .cornerRadius(20)
                        
                        HStack(spacing: 25){
                            Image(item.itemImage ?? "")
                                .resizable().frame(width:70, height: 70).clipShape(Circle()).padding(.leading)
                            VStack(alignment: .leading, spacing: 4){
                                HStack(spacing: 0){
                                    Text(item.itemName ?? "").bold().padding(.trailing,75)
                                    Image(systemName: "mappin")
                                    Text(item.itemLocation ?? "")
                                        .font(.subheadline)
                                }
                                Text(item.itemRate ?? "").font(.caption)
                                Text(item.itemPrice ?? "").font(.subheadline).padding(5).background(Color.blue.opacity(0.2)) .border(Color.blue.opacity(0.2), width: 3)
                                
                            }
                        }
                    }
                }
                Menu("Menu".uppercased()) {
                    Button("Reverse", action: { viewModel.reverseOrder() })
                    Button("Delete Restaurant", action: { viewModel.DeleteRestaurant() })
                    Button("Remove last", action: { viewModel.removeLastRestaurant() })
                    Button("Remove first", action: { viewModel.removeFirstRestaurant() })
                }
            }
                .searchable(text: $searchText) {
                    ForEach(viewModel.restaurant.filter { $0.itemName!.contains(searchText) || $0.itemPrice!.contains(searchText) }, id: \.id) { rest in
                        HStack() {
                            Text(rest.itemName ?? "")
                                .font(.title3)
                            Text(rest.itemPrice ?? "")
                                .font(.title3).bold()
                        }
                    
                }
            }
        }
    }
}
struct MVVMRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        MVVMRestaurantView()
    }
}
