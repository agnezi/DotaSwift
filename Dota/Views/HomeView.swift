////
// Dota
// Created by: itsjagnezi on 17/12/22
// Copyright (c) today and beyond
//

import SwiftUI

struct HomeView: View {
	
	@EnvironmentObject var heroesViewModel: HeroesViewModel
	
	var body: some View {
		GeometryReader { geo in
			ScrollView {
				switch heroesViewModel.fetchHeroesState {
				case .isLoading:
					Text("Fetching data...")
				case .isError:
					Text("Something went wrong")
				case .isSuccess:
						HeroesView(geo: geo)
				case .isIdle:
					Text("Doing nothing")
				}
			}
		}
		.navigationTitle("Heroes")
		.navigationBarTitleDisplayMode(.inline)
	}
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView()
	}
}
