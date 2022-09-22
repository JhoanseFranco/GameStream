//
//  HomeView.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 13/08/22.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
    /*---------------
     CAMBIAR COLOR DE BACKGROUND A TabBar
     -----------------*/
    
    init(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color("Menu"))
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    @State var selectedBar = 2
    
    var body: some View {
        
        TabView(selection: $selectedBar){
            
            ProfileView()
                .tabItem{
                    Label("Perfil", systemImage: "person")
                }.tag(0)
            
            GamesView()
                .tabItem{
                    Label("Juegos", systemImage: "gamecontroller")
                }.tag(1)
            
            Home()
                .tabItem({
                    Label("Inicio", systemImage: "house")
                })
                .tag(2)
            
            FavoritesView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart")
                }.tag(3)
            
        }
        .accentColor(Color("PureWhite"))
        
        
    }
}

struct Home: View{
    var body: some View{
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack{
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 183)
                    .padding(.bottom, 28)
                
                subModuleHome()
                
            }
            .padding([.trailing, .leading], 10)
            
        }
        .navigationBarHidden(true)
        
    }
    
}

struct subModuleHome: View{
    
    @State var search = ""
    @State var isGameInfoEmpty = false
    @ObservedObject var gameFound = Search()
    @State var isGameViewActive = false
    @State var urlVideos: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var contentRaiting: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [String]()
    @State var galleryImages: [String] = [String]()
    
    var body: some View{
        
        ScrollView {
            
            VStack{
                
                /*---------------
                 BARRA DE BUSQUEDA
                 -----------------*/
                
                HStack{
                    
                    Button(action: {
                        searchGame(gameName: search)
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(search.isEmpty ? Color("LightGray") : Color("DarkCian"))
                            .font(.system(size: 18))
                            .alert(isPresented: $isGameInfoEmpty) {
                                Alert(title: Text("alert"), message: Text("No se ha encontrado información"), dismissButton: .default(Text("Aceptar")))
                            }
                    })
                    
                    ZStack(alignment: .leading){
                        if search.isEmpty {
                            Text("Buscar un video")
                                .foregroundColor(Color("LightGray"))
                        }
                        TextField("", text: $search).foregroundColor(Color("PureWhite"))
                    }
                }
                .padding(.init(top: 10, leading: 16, bottom: 10, trailing: 16))
                .background(Color("BlueGray"))
                .clipShape(Capsule())
                
                
                /*-----------------------
                 SECCIÓN LOS MÁS POPULARES
                 ------------------------*/
                
                VStack {
                    Text("LOS MÁS POPULARES")
                        .foregroundColor(Color("PureWhite"))
                        .font(.title3)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 18)
                    
                    Button {
                        searchGame(gameName: "witcher")
                    } label: {
                        VStack(spacing: 0){
                            ZStack {
                                Image("TheWitcher")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                
                                Image(systemName: "play.circle.fill")
                                    .font(.system(size: 50))
                                    .foregroundColor(Color("PureWhite"))
                            }
                            
                            Text("The witcher 3: Wild Hunt")
                                .bold()
                                .padding([.top, .bottom], 13).padding([.leading, .trailing], 10)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .background(Color("BlueGray"))
                            
                        }
                        
                    }
                }
                .padding(.top, 28)
                
                /*-------------------------------
                 SECCIÓN CAREGORÍAS SUGERIDAS PARA TI
                 ----------------------------------*/
                
                VStack{
                    Text("CAREGORÍAS SUGERIDAS PARA TI")
                        .foregroundColor(Color("PureWhite"))
                        .font(.title3)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack {
                            Button(action: {}) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color("BlueGray"))
                                        .frame(width: 195, height: 109)
                                    
                                    Image("FPS")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 125, height: 65)
                                }
                            }
                            Button(action: {}) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color("BlueGray"))
                                        .frame(width: 195, height: 109)
                                    
                                    Image("RPG")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 125, height: 65)
                                }
                            }
                            Button(action: {}) {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 4)
                                        .fill(Color("BlueGray"))
                                        .frame(width: 195, height: 109)
                                    
                                    Image("OpenWorld")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 125, height: 65)
                                }
                            }
                            
                        }
                        
                    }
                    
                }
                .padding(.top, 28)
                
                /*-------------------------------
                 SECCIÓN RECOMENDADO PARA TI
                 ----------------------------------*/
                
                VStack{
                    Text("RECOMENTADO PARA TI")
                        .font(.title3)
                        .foregroundColor(Color("PureWhite"))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            Button {
                                searchGame(gameName: "the last")
                            } label: {
                                Image("Game1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 228, height: 128)
                            }
                            Button {
                                searchGame(gameName: "assassins")
                            } label: {
                                Image("Game2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 228, height: 128)
                            }
                            Button {
                                searchGame(gameName: "titanfall")
                            } label: {
                                Image("Game3")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 228, height: 128)
                            }
                            
                        }
                    }
                    
                }
                .padding(.top, 28)
                
                /*-------------------------------
                 SECCIÓN VIDEOS QUE PODRIAN GUSTARTE
                 ----------------------------------*/
                
                VStack{
                    Text("VIDEOS QUE PODRÍAN GUSTARTE")
                        .font(.title3)
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            Button {
                                searchGame(gameName: "spiderman")
                            } label: {
                                Image("Game4")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 228, height: 128)
                            }
                            Button {
                                searchGame(gameName: "desti")
                            } label: {
                                Image("Game5")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 228, height: 128)
                            }
                            Button {
                                searchGame(gameName: "battlefield")
                            } label: {
                                Image("Game6")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 228, height: 128)
                            }
                            
                        }
                    }
                }
                .padding(.top, 28)
                
            }
        }
        
        NavigationLink(isActive: $isGameViewActive) {
            GameView(urlVideos: urlVideos, title: title, studio: studio, contentRaiting: contentRaiting, publicationYear: publicationYear, description: description, tags: tags, galleryImages: galleryImages)
        } label: {
            EmptyView()
        }
        
    }
    
    func searchGame(gameName: String){
        gameFound.searchGame(gameName: gameName)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            if gameFound.gameInfo.count == 0{
                isGameInfoEmpty = true
            }else{
                urlVideos = gameFound.gameInfo[0].videosUrls.mobile
                title = gameFound.gameInfo[0].title
                studio = gameFound.gameInfo[0].studio
                contentRaiting = gameFound.gameInfo[0].contentRaiting
                publicationYear = gameFound.gameInfo[0].publicationYear
                description = gameFound.gameInfo[0].description
                tags = gameFound.gameInfo[0].tags
                galleryImages = gameFound.gameInfo[0].galleryImages
                isGameViewActive = true
                
            }
        }
    }
    
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
