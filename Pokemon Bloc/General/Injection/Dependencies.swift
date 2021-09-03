//
//  Dependencies.swift
//  Dependencies
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

struct Dependencies {
    
    private static var ledger: [Registration: ResolveState] = [:]
    
    static func resolve<T>() -> T? {
        guard let result = ledger.first(where: { $0.key.type == T.self }) else {
            assertionFailure("\(T.self) not registered")
            return nil
        }
        switch result.key.resolveStyle {
        case .alwaysFresh:
            return result.key.factory() as? T
        case .singleton:
            switch result.value {
            case .resolved(let value):
                return value as? T
            case .unresolved:
                guard let value = result.key.factory() as? T else {
                    assertionFailure("factory couldn't produce \(T.self)")
                    return nil
                }
                ledger[result.key] = .resolved(value)
                return value
            }
        }
    }
    
    static func register<T>(_ type: T.Type, factory: @escaping () -> T?, style: ResolveStyle = .alwaysFresh) {
        ledger[Registration(type: type, resolveStyle: style, factory: factory)] = .unresolved
    }
}

extension Dependencies {
    
    enum ResolveStyle {
        case alwaysFresh
        case singleton
    }
}

private extension Dependencies {
    
    struct Registration: Hashable {
        
        let type: Any.Type
        let resolveStyle: ResolveStyle
        let factory: () -> Any
        
        func hash(into hasher: inout Hasher) { hasher.combine( String(describing: type)) }
        
        static func == (lhs: Dependencies.Registration, rhs: Dependencies.Registration) -> Bool { lhs.hashValue == rhs.hashValue }
    }
    
    enum ResolveState {
        case unresolved
        case resolved(Any)
    }
}
