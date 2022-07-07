//
//  AuthenticationService.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Combine
import Foundation

struct AuthenticationService: AuthenticationServicing {
    private static let usernameKey = "username"
    private static let isLoggedInKey = "isLoggedIn"
    
    var isLoggedIn: Bool {
        UserDefaults.standard.value(forKey: Self.isLoggedInKey) is String
    }
    
    var username: String? {
        UserDefaults.standard.value(forKey: Self.usernameKey) as? String
    }
    
    func login(username: String, password: String) -> AnyPublisher<User, AuthenticationError> {
        if username.isEmpty {
            return Fail(error: AuthenticationError.invalidUsername)
                .eraseToAnyPublisher()
        } else if password != "password" {
            return Fail(error: AuthenticationError.invalidPassword)
                .eraseToAnyPublisher()
        } else {
            UserDefaults.standard.set(username, forKey: Self.usernameKey)
            UserDefaults.standard.set(true, forKey: Self.isLoggedInKey)
            
            return Just(.init(username: username))
                .setFailureType(to: AuthenticationError.self)
                .eraseToAnyPublisher()
        }
    }
    
    func logout() -> AnyPublisher<Void, Error> {
        UserDefaults.standard.set(nil, forKey: Self.usernameKey)
        UserDefaults.standard.set(false, forKey: Self.isLoggedInKey)
        
        return Empty()
            .eraseToAnyPublisher()
    }
}
