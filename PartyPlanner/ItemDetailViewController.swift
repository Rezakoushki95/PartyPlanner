//
//  ItemDetailViewController.swift
//  PartyPlanner
//
//  Created by Reza Koushki on 21/09/2022.
//

import UIKit

class ItemDetailViewController: UIViewController {
	
	@IBOutlet weak var personResponsibleField: UITextField!
	@IBOutlet weak var partyItemField: UITextField!
	@IBOutlet weak var saveBarButton: UIBarButtonItem!
	
	var partyItem: String!
	var personResponsible: String!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		if partyItem == nil {
			partyItem = ""
		}
		if personResponsible == nil {
			personResponsible = ""
		}
		personResponsibleField.text = personResponsible
		partyItemField.text = partyItem
    }
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		partyItem = partyItemField.text
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
