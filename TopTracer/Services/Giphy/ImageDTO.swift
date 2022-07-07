//
//  ImageDTO.swift
//  TopTracer
//
//  Created by Richard Segerblom on 2022-07-07.
//

import Foundation

struct ImageDTO: Decodable {
    let data: Data
    
    struct Data: Decodable {
        let title: String
        let username: String
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case title
            case username
            case images
            case downsized
            case url
        }
        
        enum DecodingError: Error {
            case missingKey
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            title = try container.decode(String.self, forKey: .title)
            username = try container.decode(String.self, forKey: .username)
            
            let images = try container.decode([String: [String: String]].self, forKey: .images)
            
            guard let image = images[CodingKeys.downsized.rawValue],
                  let url = image[CodingKeys.url.rawValue] else {
                throw DecodingError.missingKey
            }
            
            self.url = url
        }
    }
}
