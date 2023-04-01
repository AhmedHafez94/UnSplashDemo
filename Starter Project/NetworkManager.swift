//
//  NetworkManager.swift
//  Starter Project
//
//  Created by Ahmed Hafez on 4/1/23.
//

import Foundation

struct NetworkManager {
    
    static func fetchPhotos(for page: Int, completion: @escaping (_ photos: [Photo]) -> Void) {
        
        let endPoint = Constants.photosUrl
        
        guard let url = URL(string: endPoint) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion([])
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
               completion([])
                return
            }
            
            guard let data = data else {
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let photos = try decoder.decode([Photo].self, from: data)
                print("photos will be printed \(photos)")
                completion(photos)
            } catch {
                print("error fetching photos \(error.localizedDescription)")
            }
            
        }
        
        task.resume()
        
    }
}
