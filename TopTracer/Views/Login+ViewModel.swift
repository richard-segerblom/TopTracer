//
//  Login+ViewModel.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Foundation
import Combine

extension Login {
    final class ViewModel: ObservableObject {
        @Published var presentAlert: Bool = false
        @Published var errorMessage: String = ""
        
        private let authenticationService: AuthenticationServicing
        
        private let loginAction: () -> Void
        
        private var loginSubscription: AnyCancellable?
        
        init(authenticationService: AuthenticationServicing, loginAction: @escaping () -> Void) {
            self.authenticationService = authenticationService
            self.loginAction = loginAction
        }
        
        func login(username: String, password: String) {
            loginSubscription = authenticationService.login(username: username, password: password)
                .sink(receiveCompletion: { completion in
                    if case .failure(let error) = completion {
                        self.presentAlert = true
                        self.errorMessage = error.localizedDescription
                    }
                }, receiveValue: { user in
                    self.loginAction()
                })
        }
    }
}
