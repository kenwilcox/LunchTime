//
//  ViewController.swift
//  LunchTime
//
//  Created by Kenneth Wilcox on 5/13/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import LunchTimeShare

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "startDay:", name: "START_DAY", object: nil)
//    var obj: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("startDay")
//    if (obj != nil) {
//      var date = obj as! NSDate
//      println(date)
//    }
    
    var workDayItems = LunchTimeHelper.sharedInstance.getWorkDayItems()
    println(workDayItems.count)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func startDay(notification: NSNotification) {
    println("startDay")
  }
}

