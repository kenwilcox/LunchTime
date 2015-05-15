//
//  LunchTime.swift
//  LunchTime
//
//  Created by Kenneth Wilcox on 5/15/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation

public class LunchTime {
  
  public class func startDay() {
    NSUserDefaults.standardUserDefaults().setValue(NSDate(), forKey: "startDay")
  }
}