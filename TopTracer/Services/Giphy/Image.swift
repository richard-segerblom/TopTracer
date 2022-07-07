//
//  Image.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Foundation

struct Image {
    let title: String
    let author: String
    let url: URL
    
    init?(_ imageDTO: ImageDTO) {
        title = imageDTO.data.title
        author = imageDTO.data.username
        
        guard let url = URL(string: imageDTO.data.url) else { return nil }
        self.url = url
    }
}
