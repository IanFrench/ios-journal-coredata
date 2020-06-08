//
//  ViewController.swift
//  Journal
//
//  Created by Ian French on 6/3/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

class CreateEntryViewController: UIViewController {
    
    
    @IBOutlet weak var entryTitleTextField: UITextField!
    
    @IBOutlet weak var entryDetailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let entryTitle = entryTitleTextField.text, !entryTitle.isEmpty,
            let entryDetail = entryDetailTextView.text, !entryDetail.isEmpty else  { return }
        
        Entry(title: entryTitle, bodyText: entryDetail, context: CoreDataStack.shared.mainContext)
        
        do {
            try CoreDataStack.shared.mainContext.save()
            navigationController?.dismiss(animated: true, completion: nil)
        } catch {
            NSLog("Error saving managed object context: \(error)")
            
        }
        
    }
    
}

