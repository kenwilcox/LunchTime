//
//  WorkDay.swift
//  LunchTime
//
//  Created by Kenneth Wilcox on 5/17/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation
import CoreData

@objc(WorkDay)
public class WorkDay: NSManagedObject {
  
  @NSManaged var startTime: NSDate
  @NSManaged var lunchTimeStart: NSDate
  @NSManaged var lunchTimeEnd: NSDate
  @NSManaged var endTime: NSDate
  @NSManaged var snoozeCount: NSNumber
  
}
