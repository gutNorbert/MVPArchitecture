//
//  TrafficViewController.swift
//  MVPArchitecture
//
//  Created by Norbert Gutpintér on 2022. 03. 14..
//

import UIKit

protocol TrafficLightViewDelegate: NSObjectProtocol {
	func displayTrafficLight(description:(String))
}

class TrafficLightViewController: UIViewController, TrafficLightViewDelegate {

	@IBOutlet weak var descriptionLabel: UILabel!
	private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())

	override func viewDidLoad() {
		super.viewDidLoad()

		trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
	}

	@IBAction func redLightAction(_ sender: Any) {
		trafficLightPresenter.trafficLightColorSelected(colorName:"Red")
	}

	@IBAction func yellowLightAction(_ sender: Any) {
		trafficLightPresenter.trafficLightColorSelected(colorName:"Yellow")
	}

	@IBAction func greenLightAction(_ sender: Any) {
		trafficLightPresenter.trafficLightColorSelected(colorName:"Green")
	}

	func displayTrafficLight(description:(String)) {
		descriptionLabel.text = description
	}
}
