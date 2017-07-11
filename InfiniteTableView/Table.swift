//
//  Table.swift
//  InfiniteTableView

import Foundation

let numberOfRecords = 200000

class Table {
    
    lazy var records: [Record] = {
        var recs:[Record] = []
        var word:String = ""
        for i in 0...numberOfRecords {
            let rec = Record()
            rec.date = Date.randomWithinDaysBeforeToday(days: 5)
            rec.number = i
            recs.append(rec)
        }
        let srecs = recs.sorted { $0.date > $1.date }
        for i in 0...srecs.count-1 {
            srecs[i].row = i
        }
        return srecs
    }()
    
    
    
    func count(query:String) -> Int {
        return records.count
    }
    
    func select(query:String, offset:Int, limit:Int) -> [Record] {
        var recs:[Record] = []
        
        usleep(4000) // emulate latency
        if offset >= 0 {
            let end = offset + limit - 1
            
            for i in offset...end {
                if i >= records.count {
                    break
                }
                else {
                    let record = records[i]
                    //  record.row = i
                    recs.append(record)
                }
            }
        }
        return recs
    }
    
}
