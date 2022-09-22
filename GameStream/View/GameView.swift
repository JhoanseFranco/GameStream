//
//  GameView.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 27/08/22.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var urlVideos: String
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var tags: [String]
    var galleryImages: [String]
    
    var body: some View {
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack {
                Video(urlVideo: urlVideos)
                    .ignoresSafeArea()
                    .frame(height: 385)
                
                ScrollView{
                    detailVideo(title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, tags: tags)
                    
                    Gallery(urlImages: galleryImages)
                    
                    Comments()
                    
                    SimilarGames()
                }
            }
        }
        
    }
}

struct Video: View{
    var urlVideo: String
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string: urlVideo)!))
    }
}

struct detailVideo: View{
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var tags: [String]
    
    var body: some View{
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .padding(.bottom, 8)
            Text(studio + "  " + contentRaiting + "  " + publicationYear)
                .font(.system(size: 14))
                .padding(.bottom, 18)
            Text(description)
                .padding(.bottom, 8)
            
            HStack{
                ForEach(tags, id:\.self){ tag in
                    Text("#\(tag)")
                }
            }
        }
        .padding([.leading, .trailing], 10)
        .padding(.top, 28)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Color("PureWhite"))
    }
}

struct Gallery: View{
    
    var urlImages: [String]
    let shapeGrid = [GridItem(.flexible())]
    
    var body: some View{
        
        VStack(alignment: .leading){
            Text("GALERÍA")
                .font(.title)
                .padding(.bottom, 24)
            
            ScrollView(.horizontal){
                LazyHGrid(rows: shapeGrid, spacing: 10) {
                    
                    ForEach(urlImages, id: \.self){ urlImage in
                        KFImage(URL(string: urlImage))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                    
                }
            }.frame(maxWidth: .infinity)
            
        }
        .foregroundColor(Color("PureWhite"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding([.leading, .trailing], 10)
        
    }
}

struct Comments: View{
    var body: some View{
        VStack(alignment: .leading){
            Text("COMENTARIOS")
                .font(.title)
                .padding(.bottom, 28)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            VStack{
                
                HStack{
                    Image("PicturePerfil")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 48)
                        .padding(.trailing, 18)
                    VStack(alignment: .leading){
                        Text("Geoff Atto")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("Hace 7 días")
                        
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 18) 
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
            }
            .padding(14)
            .background(Color("Menu").opacity(0.6))
            .clipShape(RoundedRectangle.init(cornerRadius: 8))
        }
        .padding([.leading, .trailing], 10)
        .foregroundColor(Color("PureWhite"))
        .padding(.bottom, 28)
    }
}

struct SimilarGames: View{
    
    @State var isActive = false
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    let urlVideos: [String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4"]
    
    var body: some View{
        VStack(alignment: .leading){
            Text("JUEGOS SIMILARES")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 24)
            
            ScrollView(.horizontal){
                HStack{
                    
                    Image("SimilarGameImage1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 238, height: 148)
                    
                    Image("SimilarGameImage2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 238, height: 148)
                }
            }.frame(maxWidth: .infinity)
        }
        .foregroundColor(Color("PureWhite"))
        .padding([.leading, .trailing], 10)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(urlVideos: "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4", title: "The Witcher 3: Wild Hunt", studio: "CD Project Red", contentRaiting: "M", publicationYear: "215", description: "As war rages on throughout the Northern Realms, you take on the greatest contract of your life — tracking down the Child of Prophecy, a living weapon that can alter the shape of the world.", tags: [
            "PC",
            "Playstation 4",
            "Xbox One"
          ], galleryImages: [
            "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg",
            "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.600x338.jpg",
            "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.600x338.jpg"
          ])
    }
}
