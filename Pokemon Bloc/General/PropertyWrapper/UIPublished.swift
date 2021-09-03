//
//  UIPublished.swift
//  UIPublished
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Combine
import SwiftUI

/// An @Published wrapper that only notifies from the main thread, to be UI safe
@propertyWrapper
struct UIPublished<T> {
    
    var wrappedValue: T
    
    init(wrappedValue value: T) {
        self.wrappedValue = value
    }
    
    static subscript<EnclosingSelf: ObservableObject>(
        _enclosingInstance object: EnclosingSelf,
        wrapped wrappedKeyPath: ReferenceWritableKeyPath<EnclosingSelf, T>,
        storage storageKeyPath: ReferenceWritableKeyPath<EnclosingSelf, UIPublished<T>>
    ) -> T {
        get {
            return object[keyPath: storageKeyPath].wrappedValue
        }
        set {
            object[keyPath: storageKeyPath].wrappedValue = newValue
            mainThread { (object.objectWillChange as? ObservableObjectPublisher)?.send() }
        }
    }
}
