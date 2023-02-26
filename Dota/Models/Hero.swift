////
// Dota
// Created by: itsjagnezi on 17/12/22
// Copyright (c) today and beyond
//

import Foundation



struct Hero: Codable, Identifiable {
	let id: Int
	let name: String
	let localized_name: String
	let primary_attr: String
	let attack_type: String
	let roles: [String]
}
