//
//  Settings.swift
//  LunchTime
//
//  Created by Kenneth Wilcox on 5/17/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import Foundation
import CoreData

@objc(Settings)
class Settings: NSManagedObject {
  
  @NSManaged var lunchTimeMinutes: NSNumber
  @NSManaged var hoursUntilLunch: NSNumber
  
}
