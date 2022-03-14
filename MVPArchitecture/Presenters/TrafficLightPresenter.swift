//
//  TrafficLightPresenter.swift
//  MVPArchitecture
//
//  Created by Norbert Gutpintér on 2022. 03. 14..
//

import Foundation

class TrafficLightPresenter {
	private let trafficLightService:TrafficLightService
	weak private var trafficLightViewDelegate : TrafficLightViewDelegate?

	init(trafficLightService:TrafficLightService){
		self.trafficLightService = trafficLightService
	}

	func setViewDelegate(trafficLightViewDelegate:TrafficLightViewDelegate?){
		self.trafficLightViewDelegate = trafficLightViewDelegate
	}

	func trafficLightColorSelected(colorName:(String)){

		trafficLightService.getTrafficLight(colorName: colorName) { [weak self] traficLight in

			if let traficLight = traficLight {
				self?.trafficLightViewDelegate?.displayTrafficLight(description: traficLight.description)
			}
		}
	}
}
