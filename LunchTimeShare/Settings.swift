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
public class Settings: NSManagedObject {
  
  @NSManaged public var lunchTimeMinutes: NSNumber
  @NSManaged public var hoursUntilLunch: NSNumber
  
}
