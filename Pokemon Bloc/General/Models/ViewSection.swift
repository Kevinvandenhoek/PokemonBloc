//
//  Section.swift
//  Section
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

import Foundation

enum ViewSection<Element> {
    case initial
    case loading
    case loaded(Element)
    case error(title: String, description: String, action: ButtonAction?)
}
