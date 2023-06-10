//
//  ProfileView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//


import SwiftUI

struct ProfileView: View {
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 50, height:50)
                        .foregroundColor(.gray)
                    Text("Noura Alowayid")
                        .font(.title3)
                        .bold()
                        .padding(.trailing,70)
                    Image(systemName: "bell.badge")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("mrsool"))
                        .padding()
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("mrsool"))
                }
                Divider()
                Image("profileads")
                    .resizable()
                    .frame(width: 400, height: 200)
                ForEach(allList) { item in
                    VStack {
                        HStack {
                            Text(item.profileText)
                                .font(.title3)
                            Spacer()
                            Text(item.profileNav)
                                .foregroundColor(Color("mrsool"))
                                .font(.footnote)
                        }.padding()
                        Divider()
                    }
                }
            }
            
        }
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
