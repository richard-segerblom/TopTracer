//
//  Logout+ViewModel.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Foundation
import Combine

extension Logout {
    final class ViewModel: ObservableObject {
        @Published var image: Image?
        
        var title: String { "Welcome " + (authenticationService.username ?? "") }
        
        private let authenticationService: AuthenticationServicing
        private let giphyService: GiphyServicing
        
        private let logoutAction: () -> Void
        
        private var logoutSubscription: AnyCancellable?
        private var imageSubscription: AnyCancellable?
        
        init(authenticationService: AuthenticationServicing, giphyService: GiphyServicing, logoutAction: @escaping () -> Void) {
            self.authenticationService = authenticationService
            self.giphyService = giphyService
            self.logoutAction = logoutAction
        }
        
        func logout() {
            logoutSubscription = authenticationService.logout()
                .sink(receiveCompletion: { _ in self.logoutAction() }, receiveValue: { _ in })
        }
        
        func fetchRandomImage() {
            imageSubscription = giphyService.fetchRandomImage()
                .receive(on: RunLoop.current)
                .sink(receiveCompletion: { _ in }, receiveValue: { self.image = $0 })
        }
    }
}
