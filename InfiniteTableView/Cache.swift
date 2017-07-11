//
//  Cache.swift
//  InfiniteTableView

import Foundation

class Cache {
    let table = Table()
    var sections:[Date] = []
    var sectionToRows:[Date:[Record]] = [:]
    
    var offset:Int = 0 {
        didSet {
            if self.offset < 0 {
                self.offset = 0
            }
        }
    }
    var limit:Int = 0
    var buffer:Int = 10
    
    func loadData() {
        print("loadData() offset=\(self.offset) limit=\(self.limit)")
        self.sectionToRows = [:]
        self.sections = []
        let records = self.table.select(query:"", offset: self.offset, limit: self.limit)
        for record in records {
            let date = record.date.dateWithoutTime()
            
            if self.sectionToRows[date] == nil {
                self.sectionToRows[date] = []
                self.sections.append(date)
            }
            self.sectionToRows[date]?.append(record)
        }
        
    }
    
    func numberOfSections() -> Int {
        return self.sections.count
    }
    
    func numberOfRows(for section:Int) -> Int {
        let date = self.sections[section]
        let records = self.sectionToRows[date]!
        return records.count
    }
    
    func section(for section:Int) -> Date {
        return self.sections[section]
    }
    
    func row(for anIndexPath:IndexPath) -> Record {
        let date = self.sections[anIndexPath.section]
        
        let records = self.sectionToRows[date]!
        let record = records[anIndexPath.row]
        return record
    }
    
    func indexPath(for rw:Int) -> IndexPath {
        var s = 0
        var r = 0
        outerLoop: for section in sections {
            for row in sectionToRows[section]! {
                if row.row == rw {
                    break outerLoop
                }
                else {
                    r += 1
                }
            }
            s += 1
        }
        
        return IndexPath(row: r, section: s)
    }
    
    
}
