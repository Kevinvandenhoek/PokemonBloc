//
//  Bloc.swift
//  Bloc
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

protocol Bloc {
    associatedtype Event
    associatedtype State
    
    var state: State { get }
    
    func handle(_ event: Event)
}
