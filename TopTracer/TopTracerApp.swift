//
//  TopTracerApp.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import SwiftUI

@main
struct TopTracerApp: App {
    var body: some Scene {
        WindowGroup {
            Authentication(viewModel: .init(authenticationService: AuthenticationService(), giphyService: GiphyService()))
        }
    }
}
