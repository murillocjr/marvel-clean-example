//
//  HomeTask.swift
//  Home
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation

struct ConnectionParameters {
    static let endpoint = "https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey=f2d62a7e0388b2cc591c651962e5c668&hash=42b315b1434e41eb13f9be0e4f1ceaed"
 }

class HomeTask {
    static func doRequest(completion: @escaping (Result<ComicsResponseDTO, Error>) -> Void) -> Void {
        
        let url = URL(string: ConnectionParameters.endpoint)!
        var request = URLRequest(url: url)

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                do {
                    let responseDTO = try JSONDecoder().decode(ComicsResponseDTO.self, from: data)
                    completion(.success(responseDTO))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
