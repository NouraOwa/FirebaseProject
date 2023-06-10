//
//  HeaderView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import SwiftUI

struct HeaderView: View {
    @State var isLoading = false
    @State private var showingAlert = false
    @State private var searchText = ""
    @ObservedObject var viewModel = RestaurantsViewModel()
    
    var body: some View {
            VStack{
                if (isLoading) {
                    ProgressView()
                }
                HStack{
                    ForEach(allCategorise) { item in
                        VStack(spacing: 0){
                            Image(item.cateIcon)
                                .resizable()
                                .frame(width:50, height: 50)
                            Text(item.cateName)
                                .font(.subheadline)
                                .frame(maxWidth: .infinity)
                        }
                    }.padding(.bottom)
                }
                VStack(alignment: .leading){
                    HStack{
                        
                        ForEach(allPrices) { item in
                            ZStack{
                                Rectangle()
                                    .frame(width:100, height: 40).foregroundColor(Color.gray.opacity(0.1))
                                    .cornerRadius(50)
                                HStack{
                                    Text(item.price)
                                    Image(item.priceIcon)
                                        .resizable()
                                    .frame(width: 20,height: 20)}
                            }
                        }
                    }.padding(.trailing,50)
                }
            }
        }
    }
struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
