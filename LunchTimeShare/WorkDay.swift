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
  
  @NSManaged public var startTime: NSDate
  @NSManaged public var lunchTimeStart: NSDate
  @NSManaged public var lunchTimeEnd: NSDate
  @NSManaged public var endTime: NSDate
  @NSManaged public var snoozeCount: NSNumber
  
}
