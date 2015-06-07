//
//  Size.swift
//  Cartography
//
//  Created by Robert Böhnke on 18/06/14.
//  Copyright (c) 2014 Robert Böhnke. All rights reserved.
//

#if os(iOS)
import UIKit
#else
import AppKit
#endif

public struct Size : Compound, RelativeCompoundEquality, RelativeCompoundInequality {
    public let context: Context
    public let properties: [Property]

    internal init(_ context: Context, _ properties: [Property]) {
        self.context = context
        self.properties = properties
    }
}

// MARK: Multiplication

public func * (m: CGFloat, rhs: CARExpression<Size>) -> CARExpression<Size> {
    return CARExpression(rhs.value, rhs.coefficients.map { $0 * m })
}

public func * (lhs: CARExpression<Size>, rhs: CGFloat) -> CARExpression<Size> {
    return rhs * lhs
}

public func * (m: CGFloat, rhs: Size) -> CARExpression<Size> {
    return CARExpression(rhs, [ Coefficients(m, 0), Coefficients(m, 0) ])
}

public func * (lhs: Size, rhs: CGFloat) -> CARExpression<Size> {
    return rhs * lhs
}

// MARK: Division

public func / (lhs: CARExpression<Size>, rhs: CGFloat) -> CARExpression<Size> {
    return lhs * (1 / rhs)
}

public func / (lhs: Size, rhs: CGFloat) -> CARExpression<Size> {
    return lhs * (1 / rhs)
}
