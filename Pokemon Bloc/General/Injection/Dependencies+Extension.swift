//
//  Dependencies+Extension.swift
//  Dependencies+Extension
//
//  Created by Kevin van den Hoek on 03/09/2021.
//

extension Dependencies {
    
    static func register<Service>(_ service: Service.Type, initializer: @escaping (()) -> Service) {
        return register(service.self, factory: {
            initializer(())
        })
    }
    
    static func register<Service, A>(_ service: Service.Type, initializer: @escaping (A) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve() else { return nil }
            return initializer(a)
        })
    }
    
    static func register<Service, A, B>(_ service: Service.Type, initializer: @escaping ((A, B)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve() else { return nil }
            return initializer((a, b))
        })
    }
    
    static func register<Service, A, B, C>(_ service: Service.Type, initializer: @escaping ((A, B, C)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve() else { return nil }
            return initializer((a, b, c))
        })
    }
    
    static func register<Service, A, B, C, D>(_ service: Service.Type, initializer: @escaping ((A, B, C, D)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve() else { return nil }
            return initializer((a, b, c, d))
        })
    }
    
    static func register<Service, A, B, C, D, E>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve() else { return nil }
            return initializer((a, b, c, d, e))
        })
    }
    
    static func register<Service, A, B, C, D, E, F>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve() else { return nil }
            return initializer((a, b, c, d, e, f))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve(), let n: N = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m, n))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve(), let n: N = resolve(), let o: O = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve(), let n: N = resolve(), let o: O = resolve(), let p: P = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve(), let n: N = resolve(), let o: O = resolve(), let p: P = resolve(), let q: Q = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve(), let n: N = resolve(), let o: O = resolve(), let p: P = resolve(), let q: Q = resolve(), let r: R = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve(), let n: N = resolve(), let o: O = resolve(), let p: P = resolve(), let q: Q = resolve(), let r: R = resolve(), let s: S = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s))
        })
    }
    
    static func register<Service, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_ service: Service.Type, initializer: @escaping ((A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T)) -> Service) {
        return register(service.self, factory: {
            guard let a: A = resolve(), let b: B = resolve(), let c: C = resolve(), let d: D = resolve(), let e: E = resolve(), let f: F = resolve(), let g: G = resolve(), let h: H = resolve(), let i: I = resolve(), let j: J = resolve(), let k: K = resolve(), let l: L = resolve(), let m: M = resolve(), let n: N = resolve(), let o: O = resolve(), let p: P = resolve(), let q: Q = resolve(), let r: R = resolve(), let s: S = resolve(), let t: T = resolve() else { return nil }
            return initializer((a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t))
        })
    }
}
