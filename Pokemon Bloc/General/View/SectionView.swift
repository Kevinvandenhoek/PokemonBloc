//
//  SectionView.swift
//  SectionView
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import SwiftUI

struct SectionView<Content: View, Element>: View {
    
    typealias Section = ViewSection<Element>
    
    let section: Section
    @ViewBuilder let content: (Element) -> Content
    
    init(_ section: Section, @ViewBuilder content: @escaping (Element) -> Content) {
        self.section = section
        self.content = content
    }
    
    var body: some View {
        switch section {
        case .initial:
            Color.clear
        case .loading:
            ProgressView()
        case .loaded(let element):
            content(element)
        case .error(let title, let description, let action):
            VStack {
                Text(title)
                Text(description)
                OptionalView(action) { action in
                    Button(action.title, action: action.invoke)
                }
            }
        }
    }
}
