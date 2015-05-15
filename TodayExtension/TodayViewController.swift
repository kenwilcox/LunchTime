//
//  TodayViewController.swift
//  LunchTimeNotification
//
//  Created by Kenneth Wilcox on 5/13/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import NotificationCenter
import LunchTimeShare

class TodayViewController: UIViewController, NCWidgetProviding {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view from its nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
//  func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
//    println(defaultMarginInsets)
//    // iPhone 4s top = 0, left = 48, bottom = 39, right = 0
//    // iPad Air  top = 0, left = 57, bottom = 39, right = 0
//    return UIEdgeInsetsMake(8.0, 2.0, 8.0, 0.0)
////    var insets = defaultMarginInsets
////    insets.left = 0.0
////    return insets
//  }
  
  func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData
    
    completionHandler(NCUpdateResult.NewData)
  }

  @IBAction func startDayButtonPressed(sender: UIButton) {
    println("posting notification")
    NSNotificationCenter.defaultCenter().postNotificationName("START_DAY", object: nil)
  }
}
