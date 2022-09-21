//
//  ItemDetailTableViewController.swift
//  PartyPlanner
//
//  Created by Reza Koushki on 21/09/2022.
//

import UIKit

class ItemDetailTableViewController: UITableViewController {

	@IBOutlet weak var saveBarButton: UIBarButtonItem!
	override func viewDidLoad() {
        super.viewDidLoad()
    }
	@IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
		let isPresentingInAddMode = presentingViewController is UINavigationController
		if isPresentingInAddMode {
			dismiss(animated: true, completion: nil)
		} else {
			navigationController?.popViewController(animated: true)
		}
	}
}
