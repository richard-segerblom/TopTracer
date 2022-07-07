//
//  AuthenticationServicing.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Combine

protocol AuthenticationServicing {
    var username: String? { get }
    var isLoggedIn: Bool { get }
    
    func login(username: String, password: String) -> AnyPublisher<User, AuthenticationError>
    func logout() -> AnyPublisher<Void, Error>
}
