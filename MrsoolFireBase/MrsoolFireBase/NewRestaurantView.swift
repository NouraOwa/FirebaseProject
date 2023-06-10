//
//  NewRestaurantView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import Foundation
import SwiftUI

struct NewRestaurantView: View {
     
    @Binding var showModal: Bool
    @State private var itemName: String = ""
    @State private var itemRate: String = ""
    @State private var itemPrice: String = ""
    @State private var itemLocation: String = ""

    @ObservedObject private var viewModel = RestaurantsViewModel()
     
    var body: some View {
        NavigationView {
            Form {
              Section(header: Text("")) {
                  TextField("Enter Restaurant name", text: $itemName)
                  TextField("Enter Restaurant rate", text: $itemRate)
                  TextField("Enter Restaurant price", text: $itemPrice)
                  TextField("Enter Restaurant location", text: $itemLocation)

              }
              Section() {
                  Button(action: {
                      self.viewModel.addData(itemName: itemName, itemRate: itemRate, itemPrice: itemPrice, itemLocation: itemLocation)
                      self.showModal.toggle()
                  }) {
                      HStack {
                          Text("Add New")
                              .font(.title)
                      }
                  .padding()
                  .foregroundColor(.white)
                  .background(Color.blue)
                  .cornerRadius(30)
                  }
               }
            }
            .navigationTitle("New Restaurant")
        }
    }
}
