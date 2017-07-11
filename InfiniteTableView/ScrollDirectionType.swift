//
//  ScrollDirectionType.swift
//  InfiniteTableView
//

import Foundation

import Foundation

public enum ScrollDirectionType {
    case none, down, up
}

extension ScrollDirectionType: CustomDebugStringConvertible, CustomStringConvertible {
    public var debugDescription: String {
        return description
    }
    
    public var description: String {
        switch self {
        case .down:
            return "DOWN"
        case .up:
            return "UP"
        case .none:
            return "NONE"
        }
    }
}
