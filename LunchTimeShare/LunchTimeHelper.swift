//
//  LunchTimeHelper.swift
//  LunchTime
//
//  Created by Kenneth Wilcox on 5/17/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import CoreData

public class LunchTimeHelper: NSObject {
  
  private override init() {
    
  }
  
  public class var sharedInstance : LunchTimeHelper {
    struct Static {
      static var onceToken : dispatch_once_t = 0
      static var instance : LunchTimeHelper? = nil
    }
    dispatch_once(&Static.onceToken) {
      Static.instance = LunchTimeHelper()
    }
    return Static.instance!
  }
  
  public func getWorkDayItems() -> [AnyObject] {
    var request = NSFetchRequest()
    request.entity = NSEntityDescription.entityForName("WorkDay", inManagedObjectContext: CoreDataManager.sharedInstance.managedObjectContext!)
    request.sortDescriptors = [NSSortDescriptor(key: "startTime", ascending: false)]
    
    var error:NSError? = nil
    var results = CoreDataManager.sharedInstance.managedObjectContext?.executeFetchRequest(request, error: &error)
    
    // TODO: actually handle the error
    //println(error?.description)
    
    return results!
  }
}
