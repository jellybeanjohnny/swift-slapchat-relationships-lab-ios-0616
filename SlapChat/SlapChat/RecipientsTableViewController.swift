//
//  RecipientsTableViewController.swift
//  SlapChat
//
//  Created by Matt Amerige on 7/21/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class RecipientsTableViewController: UITableViewController {
    
    var recipients: [Recipient] = []
    
    let dataStore = DataStore.sharedDataStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if recipients.isEmpty {
            dataStore.generateTestData()
        }
        
        recipients = dataStore.fetchRecipients()
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipients.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recipientCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = recipients[indexPath.row].name
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showMessages" {
            if let selectedRow = tableView.indexPathForSelectedRow?.row, let messages = recipients[selectedRow].messages {
                let messagesTableVC = segue.destinationViewController as! MessagesTableViewController
                messagesTableVC.messages = messages
            }
        }
    }
    

}
