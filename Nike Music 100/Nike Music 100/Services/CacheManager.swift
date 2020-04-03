//
//  CacheManager.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/2/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

final class CacheManager {
    
    // MARK: - Singleton Stack
    static let shared = CacheManager()
    private init() {}
    
    
    // MARK: - Variable
    private let cache = NSCache<NSString, NSData>()
    
    
    // MARK: - Save
    func save(data: Data, forKey imageUrl: String) {
        cache.setObject(data as NSData, forKey: imageUrl as NSString)
    }


    // MARK: - Retrieve
    func retrieve(imageUrl: String, completion: @escaping (UIImage?) -> Void) {
        
        // Check image availability
        if let data = cache.object(forKey: imageUrl as NSString) as Data? {
            completion(UIImage(data: data))
            return
        }

        completion(nil)
        return
    }
}
