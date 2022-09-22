//
//  GamesView.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 20/08/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var allGames = viewModel()
    @State var isGameViewActive = false
    @State var urlVideos: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [String]()
    @State var galleryImages: [String] = [String]()
    let gridShape = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack{
                Text("Juegos")
                    .foregroundColor(Color("PureWhite"))
                    .font(.title)
                    .fontWeight(.bold)
                
                ScrollView{
                    LazyVGrid(columns: gridShape) {
                        ForEach(allGames.gamesInfo, id: \.self) { game in
                            
                            Button {
                                urlVideos = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                contentRaiting = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                                tags = game.tags
                                galleryImages = game.galleryImages
                                
                                isGameViewActive = true
                                
                            } label: {
                                
                                KFImage(URL(string: game.galleryImages[0]))
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle.init(cornerRadius: 8))
                            }
                            
                        }
                    }
                }
            }.padding(.horizontal, 10)
            
            NavigationLink(destination: GameView(urlVideos: urlVideos, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, tags: tags, galleryImages: galleryImages), isActive: $isGameViewActive) {
                EmptyView()
            }
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        //        .onAppear(perform: {
        //            print("Primer elemento del Json: \(allGames.gamesInfo[0])")
        //            print("El título del primer video juego es: \(allGames.gamesInfo[0].title)")
        //
        //        })
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
