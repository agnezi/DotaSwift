////
// Dota
// Created by: itsjagnezi on 17/12/22
// Copyright (c) today and beyond
//

import SwiftUI

struct ContentView: View {
	
	@StateObject var heroesViewModel = HeroesViewModel()
	
	var body: some View {
		NavigationStack {
			HomeView()
				.environmentObject(heroesViewModel)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
