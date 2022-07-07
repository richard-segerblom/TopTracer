//
//  Authentication.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import SwiftUI

struct Authentication: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        GeometryReader { geometry in
            Group {
                if viewModel.isLoggedIn {
                    Logout(viewModel: viewModel.logoutViewModel)
                } else {
                    Login(viewModel: viewModel.loginViewModel)
                }
            }
            .padding(.horizontal)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            .transition(.offset(x: 0, y: geometry.size.height))
        }
    }
}
