//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class MessagesTableViewController: UITableViewController {
    
    var messages = Set<Message>()
    
    var messagesArray: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(messages)
       messagesArray = messages.sort { (firstMessage, secondMessage) -> Bool in
            firstMessage.content > secondMessage.content
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("messagesCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = messagesArray[indexPath.row].content
        
        return cell
    }
    
    
}
