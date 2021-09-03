//
//  DispatchQueue+Extension.swift
//  DispatchQueue+Extension
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

@discardableResult
public func mainThread<T>(_ work: () -> T) -> T {
    guard !Thread.isMainThread else {
        return work()
    }
    
    return DispatchQueue.main.sync {
        return work()
    }
}
