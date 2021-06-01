//
//  HttpError.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 28/5/21.
//

import Foundation

enum HttpError: Error {
    case sessionError(error: Error)
    case requestError(error: Error)
    case serverError(error: Error)
    case encodingError(error: Error)
    case decodingError(error: Error)
    case unknown(error: Error)
    
    init(error: Error) {
        if error is DecodingError {
            self = .decodingError(error: error)
        } else {
            self = .unknown(error: error)
        }
    }
}
