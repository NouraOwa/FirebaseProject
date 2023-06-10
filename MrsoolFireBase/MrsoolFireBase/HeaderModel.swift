//
//  HeaderModel.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import Foundation
import SwiftUI

//CATEGORISE:
struct Categorise: Identifiable{
    var id = UUID()
    var cateIcon: String
    var cateName: String
}

//objects:
var cat1 = Categorise.init(cateIcon: "burg", cateName: "Burger")
var cat2 = Categorise.init(cateIcon: "fried", cateName: "Chicken")
var cat3 = Categorise.init(cateIcon: "fast", cateName: "Fast Food")
var cat4 = Categorise.init(cateIcon: "coffee", cateName: "Coffee")

//array:

let allCategorise = [cat1, cat2, cat3, cat4]

//PRICES:
struct Prices:Identifiable{
    var id = UUID()
    var price: String
    var priceIcon: String
}

//objects:
var price1 = Prices.init(price: "5 Riyal", priceIcon: "5")
var price2 = Prices.init(price: "9 Riyal", priceIcon: "9")
var price3 = Prices.init(price: "13 Riyal", priceIcon: "13")

//array
let allPrices = [price1, price2, price3]

//Orders:
struct Order: Identifiable{
    var id = UUID()
    var orderName: String
    var orderImage: String
    var orderDescription: String
    var total: String
    var duration: String
}

//objects:
var order1 = Order(orderName: "Burgerizzr", orderImage: "rizzr", orderDescription: "1- Cheese Burger without Onion.\n 2- French Frice.\n 1-Pepsi", total: "111.25 SAR", duration: "15 days")
var order2 = Order(orderName: "McDonald's", orderImage: "mac", orderDescription: "2-Mac Checken Spicy with cheese. \n 4pieces McNugget\n 1-Big Tasty", total: "92.0 SAR", duration: "19 days")
var order3 = Order(orderName: "Dawar Al Saada", orderImage: "dawar", orderDescription: "2- Egg with Cheese.\n 1- Mozzarella Cheese. \n 1-Orange Juice.", total: "67.59 SAR", duration: "20 days")
var order4 = Order(orderName: "Five Guys", orderImage: "five", orderDescription: "1- Cheese Burger without Onion.\n 2- French Frice.\n 1-Pepsi", total: "155.37 SAR", duration: "15 days")

//array:

let allOrders = [order1, order2, order3, order4]

//Profile:
//
//  ProfileModel.swift
//  MrsoolProject
//
//  Created by Noura Alowayid on 14/11/1444 AH.
//

import Foundation
struct Profile: Identifiable{
    var id = UUID()
    var profileText: String
    var profileNav: String
}

//objects:
var prof1 = Profile(profileText: "Account Balance", profileNav: "0.0 SAR")
var prof2 = Profile(profileText: "Number Of Orders", profileNav: "93 Orders")
var prof3 = Profile(profileText: "Saved Addresses", profileNav: "3 >")
var prof4 = Profile(profileText: "Service Reviews", profileNav: "26 >")
var prof5 = Profile(profileText: "Users Feedback", profileNav: "98 >")
var prof6 = Profile(profileText: "My cashback cards", profileNav: "0.0 SAR")
var prof7 = Profile(profileText: "Coupons", profileNav: "2 >")
var prof8 = Profile(profileText: "Support For Clients", profileNav: ">")


//array:

let allList = [prof1, prof2, prof3, prof4, prof5, prof6, prof7, prof8]

