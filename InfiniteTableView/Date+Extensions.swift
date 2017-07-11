//
//  Date+Extensions.swift
//  InfiniteTableView

import Foundation

public extension Date {
    /// SwiftRandom extension
    public static func randomWithinDaysBeforeToday(days: Int) -> Date {
        let today = Date()
        
        let r1 = arc4random_uniform(UInt32(days))
        let r2 = arc4random_uniform(UInt32(23))
        let r3 = arc4random_uniform(UInt32(23))
        let r4 = arc4random_uniform(UInt32(23))
        
        var offsetComponents = DateComponents()
        offsetComponents.day = Int(r1) * -1
        offsetComponents.hour = Int(r2)
        offsetComponents.minute = Int(r3)
        offsetComponents.second = Int(r4)
        
        let rndDate1 = Calendar.current.date(byAdding: offsetComponents, to: today)
        
        return rndDate1!
    }
    
    /// SwiftRandom extension
    public static func random() -> Date {
        let randomTime = TimeInterval(arc4random_uniform(UInt32.max))
        return Date(timeIntervalSince1970: randomTime)
    }
    
    func dateWithoutTime() -> Date {
        let cal:Calendar = Calendar.current
        
        let components:DateComponents = (cal as NSCalendar).components([.year, .month, .day], from: self)
        let date:Date = cal.date(from: components)!
        return date
    }
}
