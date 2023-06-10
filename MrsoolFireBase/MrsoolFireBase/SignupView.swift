//
//  SignupView.swift
//  MrsoolFireBase
//
//  Created by Noura Alowayid on 21/11/1444 AH.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

struct SignupView: View {
    @State var emailIsValid: Bool = true
    @State private var phoneNum = ""
    @State private var userID: String?
    @State private var userPhone: String?
    @State var email: String = ""
    @State var password: String = ""
    @State var username: String = ""
    @State var showPassword: Bool = false
    var pass: String
    var body: some View {
        NavigationStack{
            VStack{
                NavigationLink( destination: TabBar()){
                    Image("Logo")
                        .resizable()
                        .frame(width: 170, height: 130)
                }
                VStack(spacing: 15) {
                    TextField("Email", text: $email )
                        .foregroundColor(emailIsValid ? Color.black : Color.red)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                        .onChange(of: email) { newValue in
                            
                            if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                                
                                self.emailIsValid = true
                                
                                print("valid")
                                
                            } else {
                                
                                self.emailIsValid = false
                                
                                print("invalid")
                                
                            }
                            
                        }
                        .keyboardType(.emailAddress)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                                .shadow(radius: 30)
                        }.frame(width:300).padding()
                    TextField("Username", text: $username )
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                                .shadow(radius: 30)
                        }.frame(width:300).padding()
                    
                    TextField("Phone Number", text: $phoneNum)
                        .keyboardType(.numberPad)
                        .padding(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                                .shadow(radius: 30)
                        }.frame(width:300).padding()
                }
                
                .padding(.top,16)
                ZStack {
                    Group {
                        if showPassword {
                            TextField("",
                                      text: $password,
                                      prompt: Text(""))
                        } else {
                            SecureField(pass,
                                        text: $password)
                        }
                    }.padding(10).overlay {
                        RoundedRectangle(cornerRadius: 10).stroke(.gray, lineWidth: 2).shadow(radius: 30)
                    }.frame(width:300)
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye").foregroundColor(.gray).padding(.leading,240)
                    }
                }.padding()
                //textFieldPassSign(pass: "Confirm Password").padding()
                    Button("Create Account"){
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if error == nil {
                                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                                changeRequest?.displayName = username
                                changeRequest?.commitChanges { (error) in
                                }
                                print("تم انشاء حساب جديد")
                            } else{
                                print("حدث خطأ ما")
                        }
                    }
                }
                .frame(maxWidth: 150, maxHeight: 6)
                .padding()
                .buttonStyle(.bordered)
                .background(Color("ter"))
                .foregroundColor(Color.white)
                .cornerRadius(10)
                .padding(.top)
                    Button("Already have account? LogIn"){
                        Auth.auth().signIn(withEmail: email, password: password) {authResult, error in
                            if error == nil {
                                print("✅")
                                userID = Auth.auth().currentUser?.displayName
                            }
                        }
                    }.frame(maxWidth: .infinity)
                        .padding(.leading,140)
            }
        }
    }
}
struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(pass: "Password")
    }
}
