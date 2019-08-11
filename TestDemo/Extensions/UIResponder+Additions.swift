//
//  UIResponder+Additions.swift
//  TestDemo
//
//  Created by Fahad Attique on 11/08/2019.
//  Copyright © 2019 Fahid. All rights reserved.
//

import Foundation

extension UIResponder {
    
    func chainedResponder<T: UIResponder>(of responderType: T.Type) -> T? {
        return sequence(first: self, next: { $0.next })
            .dropFirst()    // Drop the first one as it will be self
            .first(where: { $0 is T }) as? T
    }
}
