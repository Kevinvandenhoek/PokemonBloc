//
//  Injected.swift
//  Injected
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

@propertyWrapper struct Injected <T> {
    
    private let resolvedValue: T = Dependencies.resolve()!
    
    var wrappedValue: T {
        return resolvedValue
    }
    
    init() { }
}
