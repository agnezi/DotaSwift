////
// Dota
// Created by: itsjagnezi on 25/02/23
// Copyright (c) today and beyond
//

import SwiftUI

struct HeroesView: View {
	
	var geo: GeometryProxy
	
	@EnvironmentObject var heroesViewModel: HeroesViewModel
	
	var body: some View {
		VStack{
			Button("Fetch heroes by agi") {
				Task {
					await heroesViewModel.fetchHeroes(attr: "int")
				}
			}
			.buttonStyle(.bordered)
			
			LazyVGrid(
				columns: [
					GridItem(.fixed(geo.size.width / 2), spacing: 4),
					GridItem(.fixed(geo.size.width / 2), spacing: 4)
				]
			) {
				ForEach(heroesViewModel.heroes) { hero in
					ZStack {
						Rectangle()
							.cornerRadius(12)
						
						VStack {
							Spacer()
							
							Text(hero.localized_name)
								.font(.title2)
								.padding()
							
							ScrollView(.horizontal) {
								HStack {
									ForEach(hero.roles, id: \.self) { role in
										Text(role)
											.padding(4)
											.background(.secondary)
											.clipShape(Rectangle())
											.cornerRadius(4)
									}
								}
							}
							
							Spacer()
							
							HStack {
								Spacer()
								Text(hero.primary_attr)
									.padding(.horizontal, 12)
									.background(.secondary)
									.foregroundColor(.green)
									.clipShape(Capsule())
									.offset(x: -4, y: -8)
							}
						}
						.foregroundColor(.white)
					}
					.padding(.horizontal, 8)
					.frame(width: geo.size.width / 2, height: 150)
				}
			}
		}
	}
}
