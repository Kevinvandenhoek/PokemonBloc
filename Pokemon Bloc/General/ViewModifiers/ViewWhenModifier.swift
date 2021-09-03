//
//  ViewWhenModifier.swift
//  ViewWhenModifier
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

extension View {
    
    func when(_ visible: Bool) -> some View {
        modifier(WhenModifier(shouldBeVisible: { visible }))
    }
    
    func when(_ shouldBeVisible: @escaping (() -> Bool)) -> some View {
        modifier(WhenModifier(shouldBeVisible: shouldBeVisible))
    }
}

private struct WhenModifier: ViewModifier {

    @State private var didLoad = false
    private let shouldBeVisible: (() -> Bool)

    init(shouldBeVisible: @escaping (() -> Bool)) {
        self.shouldBeVisible = shouldBeVisible
    }

    func body(content: Content) -> some View {
        if shouldBeVisible() {
            content
        } else {
            AnyView(Color.clear)
        }
    }
}
