//
//  OrdersView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        ZStack{
            Color(.gray)
                .opacity(0.1)
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    Text("Orders")
                        .foregroundColor(.black).opacity(0.6)
                        .font(.title2)
                    Divider().shadow(radius: 30)
                    Spacer()
                    Text("Latest Orders")
                        .foregroundColor(.secondary)
                        .padding(.trailing,220)
                }
                ForEach(allOrders) { item in
                    VStack(alignment: .leading){
                        HStack{
                            ZStack(){
                                Rectangle()
                                    .frame(width: 350,height: 260)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(20)
                                    .shadow(radius: 5)
                                VStack{
                                    HStack(alignment: .top){
                                        Image("done")
                                            .resizable()
                                            .frame(width:70, height: 30)
                                            .frame(maxWidth: .infinity)
                                        Text(item.duration)
                                            .foregroundColor(.secondary)
                                            .font(.footnote)
                                            .frame(maxWidth: .infinity)
                                    }.padding(.top)
                                    HStack(spacing: 0){
                                        Image(item.orderImage)
                                            .resizable()
                                            .frame(width:50, height: 50)
                                            .padding(.leading,30)
                                        Text(item.orderName)
                                            .font(.subheadline)
                                            .padding(.leading)
                                        Spacer()
                                    }
                                    VStack(){
                                        Text(item.orderDescription)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                            .padding(.trailing,90)
                                        Divider().frame(width: 350)
                                        HStack{
                                            Text("Total")
                                                .foregroundColor(.secondary)
                                                .font(.footnote)
                                            Text(item.total)
                                                .foregroundColor(Color("mrsool"))
                                                .font(.footnote)
                                                .padding(.trailing, 230)
                                        }
                                        HStack{
                                            Button("Reorder"){}
                                                .foregroundColor(Color.white).font(.title3)
                                                .frame(maxWidth: .infinity)
                                            
                                                .background(Color("mrsool"))
                                                .foregroundColor(Color.white)
                                                .frame(width: 350)
                                                .cornerRadius(20)
                                                .padding(.top)
                                            
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}

