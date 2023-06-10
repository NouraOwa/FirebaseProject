//
//  RestaurantModel.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import Foundation
import SwiftUI
import Firebase

struct Restaurant: Codable, Identifiable{
    var id = UUID().uuidString
    var itemName: String?
    var itemRate: String?
    var itemPrice: String?
    var itemLocation: String?
}

class RestaurantsViewModel: ObservableObject {
    @Published var restaurant: [Restaurant] = []
    private var db = Firestore.firestore()

    init() {
        addRestaurant()
    }
    
    func addRestaurant() {
        restaurant = allRestaurant
    }
    
    func DeleteRestaurant() {
        db.collection("restaurants").document("Llk1").delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    func reverseOrder() {
        restaurant.reverse()
    }
    
    func removeLastRestaurant() {
        restaurant.removeLast()
    }
    
    func removeFirstRestaurant() {
        restaurant.removeFirst()
    }
    
    //RESTAURANTS:
    struct Restaurant: Codable, Identifiable{
        
        var id = UUID()
        var itemImage : String?
        var itemName: String?
        var itemRate: String?
        var itemPrice: String?
        var itemLocation: String?
    }
    let allRestaurant = [
        //objects:
        Restaurant.init(itemImage: "mac", itemName: "McDonald's", itemRate: "4.1", itemPrice: "Delivery 9 SAR", itemLocation: "3.2 km"),
        Restaurant.init(itemImage: "shawa", itemName: "Shawarmer", itemRate: "4.4", itemPrice: "Delivery 5 SAR", itemLocation: "6.8 km"),
        Restaurant.init(itemImage: "pizza", itemName: "Pizza Hut", itemRate: "4.2", itemPrice: "Delivery 13 SAR", itemLocation: "8.7 km"),
        Restaurant.init(itemImage: "burger", itemName: "Burger King", itemRate: "4.4", itemPrice: "Delivery 20 SAR", itemLocation: "11.6 km"),
        Restaurant.init(itemImage: "kudo", itemName: "Kudo", itemRate: "4.4", itemPrice: "Delivery 12 SAR", itemLocation: "3.6 km")
    ]
     
    func fetchData() {
        db.collection("restaurants").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            self.restaurant = documents.map { (queryDocumentSnapshot) -> Restaurant in
                let data = queryDocumentSnapshot.data()
                let itemImage = data["itemImage"] as? String ?? ""
                let itemName = data["itemName"] as? String ?? ""
                let itemRate = data["itemRate"] as? String ?? ""
                let itemPrice = data["itemPrice"] as? String ?? ""
                let itemLocation = data["itemLocation"] as? String ?? ""

                return Restaurant(itemImage: itemImage, itemName: itemName, itemRate: itemRate, itemPrice: itemPrice, itemLocation: itemLocation)
            }
        }
    }
    
    func addData(itemName: String, itemRate: String, itemPrice: String, itemLocation: String) {
        db.collection("restaurants").document(itemName).setData([
            "itemName": itemName,
            "itemRate": itemRate,
            "itemPrice": itemPrice,
            "itemLocation": itemLocation
        ])
        { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}

