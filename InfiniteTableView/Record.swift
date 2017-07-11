//
//  Record.swift
//  InfiniteTableView
//

import Foundation

import Foundation

class Record : CustomStringConvertible {
    var date:Date!
    var number:Int!
    var row:Int!
    
    var description : String {
        return "\(date!) - \(number!)"
    }
    
}
