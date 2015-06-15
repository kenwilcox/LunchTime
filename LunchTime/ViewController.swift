//
//  ViewController.swift
//  LunchTime
//
//  Created by Kenneth Wilcox on 5/13/15.
//  Copyright (c) 2015 Kenneth Wilcox. All rights reserved.
//

import UIKit
import LunchTimeShare
import CoreData

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var fetchedResultsController: NSFetchedResultsController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "startDay:", name: "START_DAY", object: nil)
//    NSNotificationCenter.defaultCenter().addObserverForName(nil, object: nil, queue: nil) { (notification:NSNotification!) -> Void in
//      println("\(notification.name)")
//    }
    
//    var workDayItems = LunchTimeHelper.sharedInstance.getWorkDayItems()
//    println(workDayItems.count)
    
    self.setupFetchedResultsController()
    
    self.tableView.dataSource = self
//    self.tableView.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func startDay(notification: NSNotification) {
    println("startDay")
  }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource
{
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return fetchedResultsController.sections!.count
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let sectionInfo = self.fetchedResultsController.sections![section] as! NSFetchedResultsSectionInfo
    return sectionInfo.numberOfObjects
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let workDay = self.fetchedResultsController.objectAtIndexPath(indexPath) as! WorkDay
    
    cell.textLabel!.text = "Start: \(workDay.startTime)"
    
    return cell
  }
}

// MARK: - FetchedResultsControllerDelegate
extension ViewController: NSFetchedResultsControllerDelegate
{
  func setupFetchedResultsController() {
    let fetchRequest = NSFetchRequest()
    let context = CoreDataManager.sharedInstance.managedObjectContext!
    
    let entity = NSEntityDescription.entityForName("WorkDay", inManagedObjectContext: context)
    fetchRequest.entity = entity
    
    fetchRequest.sortDescriptors = [NSSortDescriptor(key: "startTime", ascending: false)]
    
    self.fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
    
    self.fetchedResultsController.delegate = self
    
    var error: NSError? = nil
    if !self.fetchedResultsController!.performFetch(&error) {
      println("An error Occured \(error)")
    }
  }
  
  func controllerDidChangeContent(controller: NSFetchedResultsController) {
    self.tableView.reloadData()
  }
}

