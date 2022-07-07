//
//  AuthenticationError.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Foundation

enum AuthenticationError: Error {
    case invalidUsername
    case invalidPassword
}

extension AuthenticationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidUsername:
            return "It looks like you forgot to provide a username."
        case .invalidPassword:
            return "The password you provided does not match our records."
        }
    }
}
