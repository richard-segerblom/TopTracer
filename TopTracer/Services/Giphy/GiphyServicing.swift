//
//  GiphyServicing.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Combine

protocol GiphyServicing {
    func fetchRandomImage() -> AnyPublisher<Image, Error>
}
