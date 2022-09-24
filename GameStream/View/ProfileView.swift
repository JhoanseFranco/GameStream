//
//  ProfileView.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 20/09/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nameUser = "Pepe"
    @State var profileImage: UIImage = UIImage(named: "PicturePerfil")!
    
    var body: some View {
        
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            VStack{
                Text("Perfil")
                    .foregroundColor(Color("PureWhite"))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 48)
                
                Image(uiImage: profileImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 85, height: 85)
                    .padding(.bottom, 12)
                    .clipShape(Circle())
                
                Text("\(nameUser)")
                    .foregroundColor(Color("PureWhite"))
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 48)
                
                Text("AJUSTES")
                    .foregroundColor(Color("PureWhite"))
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .bottom], 18)
                
                SettingsModule()
                
                Spacer()
            }
        }.onAppear {
            
            if let result = returnImage(named: "fotoPerfil"){
                profileImage = result
            }else{
                print("no se encontró la imagen")
            }
            
            let userName = SaveData()
            nameUser = userName.getUserData()[2]
        }
    }
    
    func returnImage(named: String) -> UIImage?{
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false){
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        }else{
                return nil
        }
    }
    
}

struct SettingsModule: View{
    @State var toggle = true
    @State var isEditProfileViewActive = false
    var body: some View{
        VStack(spacing: 3){
            Button {} label: {
                HStack{
                    Text("Cuenta")
                        .foregroundColor(Color("PureWhite"))
                    Spacer()
                    Text(">")
                        .foregroundColor(Color("PureWhite"))
                }
            }
                .padding()
                .background(Color("BlueGray"))
            Button {} label: {
                HStack{
                    Text("Notificaciones")
                        .foregroundColor(Color("PureWhite"))
                    Spacer()
                    Toggle("", isOn: $toggle)
                }
            }
                .padding()
                .background(Color("BlueGray"))
            Button {
                isEditProfileViewActive = true
            } label: {
                HStack{
                    Text("Editar perfil")
                        .foregroundColor(Color("PureWhite"))
                    Spacer()
                    Text(">")
                        .foregroundColor(Color("PureWhite"))
                }
            }
                .padding()
                .background(Color("BlueGray"))
            Button {} label: {
                HStack{
                    Text("Califica esta aplicación")
                        .foregroundColor(Color("PureWhite"))
                    Spacer()
                    Text(">")
                        .foregroundColor(Color("PureWhite"))
                }
            }
                .padding()
                .background(Color("BlueGray"))
            
            NavigationLink(isActive: $isEditProfileViewActive) {
                EditProfileView()
            } label: {
                EmptyView()
            }

            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
