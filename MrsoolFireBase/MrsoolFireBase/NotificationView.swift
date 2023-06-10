//
//  NotificationView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack{
            Text("Notifications")
                .foregroundColor(.black).opacity(0.6)
                .font(.title2)
            Divider().shadow(radius: 30)
            Spacer()
            Image(systemName: "megaphone")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.gray)
                .opacity(0.4)
                .padding()
            Text("No Notification Found")
                .foregroundColor(.secondary)
                .font(.title)
            Spacer()
        }
    }
}
struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}

