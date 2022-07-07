//
//  GiphyService.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Foundation
import Combine

struct GiphyService: GiphyServicing {
    private var path: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.giphy.com"
        components.path = "/v1/gifs/random"
                        
        let queryItems = [URLQueryItem(name: "api_key", value: "Uc03MOOUI9bjCdc6SHicMXylPKX5w3eb"),
                          URLQueryItem(name: "tag", value: ""),
                          URLQueryItem(name: "rating", value: "g")]

        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid url")
        }
        
        return url
    }

    func fetchRandomImage() -> AnyPublisher<Image, Error> {
        URLSession.shared.dataTaskPublisher(for: path)
            .map { $0.data }
            .decode(type: ImageDTO.self, decoder: JSONDecoder())
            .compactMap { Image($0) }
            .eraseToAnyPublisher()
    }
}
