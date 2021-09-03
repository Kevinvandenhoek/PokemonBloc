//
//  UnwrapView.swift
//  UnwrapView
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct OptionalView<Value, Content>: View where Content: View {
    
    private var content: Content

    init?(_ value: Value?, @ViewBuilder content: @escaping (Value) -> Content) {
        guard let value = value else { return nil }
        self.content = content(value)
    }

    var body: some View {
        content
    }
}
