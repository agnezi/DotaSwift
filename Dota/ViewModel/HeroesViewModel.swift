////
// Dota
// Created by: itsjagnezi on 25/02/23
// Copyright (c) today and beyond
//

import Foundation

enum FetchHeroesState {
	case isLoading, isError, isSuccess, isIdle
}

@MainActor
final class HeroesViewModel: ObservableObject {
	@Published public var heroes = [Hero]()
	@Published public var fetchHeroesState = FetchHeroesState.isIdle
	
	private var urlHeroes = URLComponents(string: "https://api.opendota.com/api/heroes")
	
	init() {
		Task {
			await fetchHeroes()
		}
	}
	
	public func fetchHeroes(attr: String? = nil) async {
		do {
			fetchHeroesState = .isLoading
			
			guard var urlHeroes else { return }
			
			if attr != nil {
				urlHeroes.queryItems = [
					URLQueryItem(name: "primary_attr", value: attr)
				]
			}
			
			guard let url = urlHeroes.url else { return }
			
			let (data, _) = try await URLSession.shared.data(from: url)
			
			let parsedData = try JSONDecoder().decode([Hero].self, from: data)
			
			fetchHeroesState = .isSuccess
			heroes = parsedData
			
		} catch {
			fetchHeroesState = .isError
			heroes = []
			print("Error trying to fetch heroes data: \(error.localizedDescription)")
		}
	}
	
	
}
