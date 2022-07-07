//
//  Authentication+ViewModel.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Foundation
import Combine

extension Authentication {
    final class ViewModel: ObservableObject {
        @Published var isLoggedIn: Bool
        
        lazy var loginViewModel: Login.ViewModel = {
            Login.ViewModel(authenticationService: authenticationService,
                            loginAction: { self.isLoggedIn = true })
        }()
        
        lazy var logoutViewModel: Logout.ViewModel = {
            Logout.ViewModel(authenticationService: authenticationService,
                             giphyService: giphyService,
                             logoutAction: { self.isLoggedIn = false })
        }()
        
        private let authenticationService: AuthenticationServicing
        private let giphyService: GiphyServicing
        
        init(authenticationService: AuthenticationServicing, giphyService: GiphyServicing) {
            self.authenticationService = authenticationService
            self.giphyService = giphyService
            
            isLoggedIn = authenticationService.isLoggedIn
        }
    }
}
