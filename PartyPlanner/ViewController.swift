//
//  ViewController.swift
//  PartyPlanner
//
//  Created by Reza Koushki on 18/09/2022.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var tableView: UITableView!
	
	var partyItems = [
		"Potato Chips",
		"Tortilla Chips",
		"Salsa",
		"Chili",
		"Punch",
		"Sudsy Beverages",
		"Brownies",
		"Cupcakes",
		"Fruit salad",
		"Ribs",
		"Corn bread",
		"Macaroni Salad",
		"Sandwich Rolls",
		"Roast Beef",
		"Ham",
		"Cheese",
		"Mayo",
		"Mustard",
		"Hummus",
		"Baby carrots",
		"Celery",
		"Veggie Dip",
		"Napkins",
		"Plates & Bowls",
		"Forks and Knives",
		"Cups"
	]
	
	var personResponsible = [String]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "EditItemDetail" {
			let destination = segue.destination as! ItemDetailViewController
			let selectedIndexPath = tableView.indexPathForSelectedRow!
			destination.partyItem = partyItems[selectedIndexPath.row]
		} else {
			if let selectedIndexPath = tableView.indexPathForSelectedRow {
				tableView.deselectRow(at: selectedIndexPath, animated: false)
			}
		}
	}
	
	@IBAction func unwindFromItemDetail(segue: UIStoryboardSegue) {
		let source = segue.source as! ItemDetailViewController
		if let selectedIndexPath = tableView.indexPathForSelectedRow {
			partyItems[selectedIndexPath.row] = source.partyItem
			tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
		} else {
			let newIndexPath = IndexPath(row: partyItems.count, section: 0)
			partyItems.append(source.partyItem)
			tableView.insertRows(at: [newIndexPath], with: .automatic)
			tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
		}
	}
	
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("*** numberOfRowsInSection was just called and there are \(partyItems.count) rows in the tv")
		return partyItems.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		cell.textLabel?.text = partyItems[indexPath.row]
		print(">>> Dequeing the table view cell for indexPath.row = \(indexPath.row) where the cell contain item \(partyItems[indexPath.row])")
		return cell
	}
	
}
