//
//  ViewController.swift
//  TimeInterval
//
//  Created by HAYAKAWA TOMOAKI on 2015/02/06.
//  Copyright (c) 2015年 HAYAKAWA TOMOAKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    var items:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "now -> " + NSDate().toString(format:"yyyy-M-d HH:mm:ss")!
        
        items = []
        items += [NSDate(timeIntervalSinceNow: -3).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -9).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -15).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -27).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -46).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -63).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -60 * 31).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -60 * 45).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -24 * 60 * 42).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -24 * 60 * 60).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -5 * 24 * 60 * 60).toString(format:"yyyy-M-d HH:mm:ss")!]
        items += [NSDate(timeIntervalSinceNow: -7 * 24 * 60 * 60).toString(format:"yyyy-M-d HH:mm:ss")!]
        
        let displayLink = CADisplayLink(target: self, selector: Selector("update:"))
        displayLink.frameInterval = 1
        displayLink.addToRunLoop(NSRunLoop.currentRunLoop(), forMode: NSRunLoopCommonModes)
    }

    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath:NSIndexPath!) -> UITableViewCell! {
        let cell = table.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
        
        let ymdhis = items[indexPath.row] as String
        let timeInterval = ymdhis.toDate(format: "yyyy-M-d HH:mm:ss")!.stringForTimeIntervalSinceCreated()
        cell.textLabel?.text = ymdhis + " : " + timeInterval
        
        return cell
    }

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int  {
        return items.count
    }

    func update(displayLink: CADisplayLink) {
        self.title = "now -> " + NSDate().toString(format:"yyyy-M-d HH:mm:ss")!
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

