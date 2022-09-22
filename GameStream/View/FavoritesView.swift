//
//  FavoritesView.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 16/09/22.
//

import SwiftUI
import AVKit

struct FavoritesView: View {
    
    @ObservedObject var allGames = viewModel()
    
    var body: some View {
        
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
            
            VStack{
                Text("Tus Favoritos")
                    .foregroundColor(Color("PureWhite"))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 28)
                
                ScrollView {
                    ForEach(allGames.gamesInfo, id:\.self){ game in
                        
                        VStack(spacing: 0) {
                            
                            VideoPlayer(player: AVPlayer(url: URL(string: game.videosUrls.mobile)!))
                                .frame(height: 225)
                            
                            Text("\(game.title)")
                                .fontWeight(.bold)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .foregroundColor(Color("PureWhite"))
                                .font(.title3)
                                .background(Color("BlueGray"))
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                        }
                    }
                }
                .padding(.bottom, 8)
            }
            .padding([.leading, .trailing], 8)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
