//
//  APIClient.swift
//  SportsPlayers
//
//  Created by Carlos Monfort on 25/10/2019.
//  Copyright © 2019 Carlos Monfort. All rights reserved.
//

import Foundation

class APIClient: NSObject, URLSessionDelegate {
    
    static let shared = APIClient()
    
    typealias APICompletion = (Result<Data?, APIError>) -> Void
    
    let URLService = "https://api.myjson.com/bins/66851"
    var session: URLSession?
    
    override init() {
        super.init()
        session = URLSession(configuration: .default)
    }
    
    /**Realiza la petición a la API*/
    func performGetRequest(_ completion: @escaping APICompletion) {
        guard let baseURL = URL(string: URLService) else { completion(.failure(.invalidURL)); return }
        guard let session = self.session else { completion(.failure(.sessionFail)); return }
        
        let task = session.dataTask(with: baseURL) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { completion(.failure(.requestFailed)); return }
            guard let data = data else { completion(.failure(.noData)); return }
            completion(.success(data))
        }
        task.resume()
    }
}
