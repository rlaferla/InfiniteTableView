//
//  ViewController.swift
//  InfiniteTableView
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView:UITableView!
    let cache = Cache()
    var scrollDirection:ScrollDirectionType = .none
    var lastScrollPosition:CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.dataSource = self
        self.cache.limit = 45
        self.cache.loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in aTableView: UITableView) -> Int {
        return self.cache.numberOfSections()
    }
    
    func tableView(_ aTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cache.numberOfRows(for: section)
    }
    
    func tableView(_ aTableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = self.cache.section(for: section)
        let df = DateFormatter()
        df.dateStyle = .short
        
        let ds = df.string(from: date)
        return "Section \(ds)"
    }
    
    func tableView(_ aTableView: UITableView, cellForRowAt anIndexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let record = self.cache.row(for: anIndexPath)
        
        let df = DateFormatter()
        df.dateStyle = .short
        
        let ds = df.string(from: record.date)
        
        cell.textLabel!.text = "\(record.row!): \(ds) - \(record.number!) at \(anIndexPath.section)-\(anIndexPath.row)"
        return cell
    }
    
    func updateScrollDirection() {
        // print("updateScrollDirection()")
        
        let scrollPosition = self.tableView.contentOffset.y
        
        if scrollPosition > self.lastScrollPosition {
            self.scrollDirection = .down
        }
        else if scrollPosition < self.lastScrollPosition {
            self.scrollDirection = .up
        }
        else {
            self.scrollDirection = .none
        }
        self.lastScrollPosition = scrollPosition
    }

}

