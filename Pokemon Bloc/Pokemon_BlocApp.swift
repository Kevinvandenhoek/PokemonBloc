//
//  Pokemon_BlocApp.swift
//  Pokemon Bloc
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

@main
struct Pokemon_BlocApp: App {
    
    init() {
        AppAssembly.assemble()
    }
    
    var body: some Scene {
        WindowGroup {
            HomePage()
        }
    }
}
