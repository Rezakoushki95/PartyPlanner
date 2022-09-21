//
//  ItemDetailViewController.swift
//  PartyPlanner
//
//  Created by Reza Koushki on 21/09/2022.
//

import UIKit

class ItemDetailViewController: UIViewController {

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
