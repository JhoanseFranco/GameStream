//
//  EditProfileView.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 20/09/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack{
            Color("Marine")
                .ignoresSafeArea()
            ScrollView{
                VStack{
                    Button {} label: {
                        ZStack{
                            Image("PicturePerfil")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 85, height: 85)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera")
                                .foregroundColor(Color("PureWhite"))
                                .frame(width: 27.5, height: 22.5)
                        }
                    }
                }
                .padding(.bottom, 28)
                
                VStack{
                    EditModule()
                }
            }
        }
    }
}

struct EditModule: View{
    @State var email = ""
    @State var password = ""
    @State var name = ""
    var body: some View{
        VStack(alignment: .leading){
            Text("Correo electrónico")
                .fontWeight(.bold)
                .foregroundColor(Color("DarkCian"))
            
            ZStack(alignment: .leading){
                if email.isEmpty{
                    Text("Introduce tu nuevo email")
                        .font(.caption)
                        .foregroundColor(Color("LightGray"))
                }
                TextField("", text: $email)
            }
            Divider()
                .frame(height: 1)
                .background(Color("DarkCian"))
                .padding(.bottom, 24)
            
            Text("Contraseña")
                .fontWeight(.bold)
            ZStack(alignment: .leading){
                if password.isEmpty{
                    Text("Introduce tu nueva contraseña")
                        .font(.caption)
                        .foregroundColor(Color("LightGray"))
                }
                SecureField("", text: $password)
            }
            Divider()
                .frame(height: 1)
                .background(Color("DarkCian"))
                .padding(.bottom, 24)
            
            Text("Nombre")
                .fontWeight(.bold)
            
            ZStack(alignment: .leading){
                if email.isEmpty{
                    Text("Introduce tu nuevo nombre de usuario")
                        .font(.caption)
                        .foregroundColor(Color("LightGray"))
                }
                TextField("", text: $name)
            }
            Divider()
                .frame(height: 1)
                .background(Color("DarkCian"))
                .padding(.bottom, 24)
            
            Button {
                
            } label: {
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 12, leading: 70, bottom: 12, trailing: 70))
                    .overlay(RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("DarkCian"), lineWidth: 1)
                                .shadow(color: Color("PureWhite"), radius: 6))
            }

            
        }
        .padding(.horizontal, 24)
        .foregroundColor(Color("PureWhite"))
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
