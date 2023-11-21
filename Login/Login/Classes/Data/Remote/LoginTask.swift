//
//  LoginTask.swift
//  Login
//
//  Created by Jorge Murillo on 5/28/21.
//

import Foundation

struct ConnectionParameters {
    static let endpoint = "https://django-backend-marvel.onrender.com/marvel/login"
 }

class LoginTask {
    static func doLogin(
        requestDTO: LoginRequestDTO,
        delegate: BackendDataHandlerDelegateProtocol?
    ) -> Void
    {
        
        do {
            let url = URL(string: ConnectionParameters.endpoint)!
            var request = URLRequest(url: url)
            let jsonData = try JSONEncoder().encode(requestDTO)

            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            let task = URLSession.shared.dataTask(with: request) {
                //when response is back from cloud
                //esta corriendo en un hilo secundario
                data, response, error in
                guard let data = data, error == nil else {
                    return
                }
                DispatchQueue.main.async { ///Ejecuta acciones en el hilo principal
                    do {
                        let responseDTO = try JSONDecoder().decode(LoginResponseDTO.self, from: data)
                        if let delegate = delegate {
                            delegate.transformAndCallExternalCompletion(loginResponseDTO: responseDTO)
                        }
                    } catch {
                        if let delegate = delegate {
                            delegate.handleBackendError(error: error)
                        }
                    }
                }
            }
            task.resume()
        } catch {
            if let delegate = delegate {
                delegate.handleBackendError(error: error)
            }
        }
    }
}
