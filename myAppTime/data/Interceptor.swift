//
//  Interceptor.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 28/5/21.
//

import Foundation


protocol Interceptor {
    func intercept(request: URLRequest)
    func intercetp(response: URLResponse, data: Data)
}

extension Interceptor {
    func intercept(request: URLRequest) {
        // no-op
    }
    
    func intercept(response: URLResponse, data: Data) {
        // no-op
    }
}
