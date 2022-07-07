//
//  Login.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import SwiftUI

struct Login: View {
    @ObservedObject var viewModel: ViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Username")
                TextField("", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
            }
            HStack {
                Text("Password ")
                SecureField("", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .disableAutocorrection(true)
            }.padding(.bottom, 40)
            HStack(spacing: 40) {
                Button("Forgot Password", action: {})
                    .disabled(true)
                Button("Login", action: {
                    withAnimation {
                        viewModel.login(username: username, password: password)
                    }
                })
            }
        }.alert("Oops!", isPresented: $viewModel.presentAlert, actions: { }, message: { Text(viewModel.errorMessage) })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(viewModel: .init(authenticationService: AuthenticationService(),
                               loginAction: { }))
            .previewLayout(.sizeThatFits)
            .padding()

    }
}
