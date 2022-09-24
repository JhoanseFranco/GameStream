//
//  ContentView.swift
//  GameStream
//
//  Created by jhoan sebastian franco cardona on 8/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            
            ZStack {
                Color("Marine").ignoresSafeArea()
                VStack{
                    Image("Logo").resizable().aspectRatio(contentMode: .fit).frame(width: 220 ).padding(.bottom, 54)
                    
                    
                    LoginRegisterView()
                }
            }.navigationBarHidden(true)
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

enum Section {
case login, register
}

struct LoginRegisterView: View{
    @State public var section: Section = .login
    var body: some View{
        
        HStack{
            
            Button("INICIAR SESIÓN") {
                self.section = .login
            }
            .frame(width: nil)
            .foregroundColor(self.section == .login ? .white : Color("PureWhite").opacity(0.5) )
            
            Spacer()
            
            Button("REGÍSTRATE") {
                self.section = .register
            }
            .foregroundColor(self.section == .register ? .white : Color("PureWhite").opacity(0.5) )
            
        }.padding([.leading, .trailing], 20)
        
               
        switch section {
        case .login:
            LoginView()
        case .register:
            RegisterView()
        }
    }
}

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isActiveHomeView = false
    @State var showAlert = false
    
    var body: some View{
        
        ScrollView {
            VStack(alignment: .leading) {
                Text("Correo electrónico")
                    .foregroundColor(Color("DarkCian"))
                
                ZStack(alignment: .leading) {
                    
                    if email.isEmpty{
                        Text(verbatim: "ejemplo@gmail.com")
                            .foregroundColor(Color("LightGray")
                            .opacity(0.7) )
                    }
                    TextField("", text: $email)
                        .foregroundColor(Color("PureWhite"))
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("DarkCian"))
                    .padding(.bottom, 36)
                
                Text("Contraseña").foregroundColor(Color("PureWhite"))
                ZStack(alignment: .leading){
                    
                    if password.isEmpty{
                        Text("*******")
                            .foregroundColor(Color("LightGray")
                            .opacity(0.7))
                    }
                    SecureField("", text: $password)
                        .foregroundColor(Color("PureWhite"))
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("PureWhite"))
                    .padding(.bottom, 12)
                
                Text("¿Olvidaste tu constraseña?")
                    .foregroundColor(Color("DarkCian"))
                    .font(.footnote)
                    .frame(width: 350, alignment: .trailing)
                    .padding(.bottom, 50)
                
                Button(action: login, label: {
                    Text("INICIAR SESIÓN")
                        .foregroundColor(Color("PureWhite"))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding([.top, .bottom], 12)
                        .overlay(RoundedRectangle(cornerRadius: 12.0).stroke(Color("DarkCian"), lineWidth: 1).shadow(color: Color("PureWhite"), radius: 6))
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("alert"), message: Text("Usuario o contraseña invalidos, vuelte a intentarlo."), dismissButton: .default(Text("Aceptar")))
                        }
                })
                    .padding(.bottom, 60)
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(Color("PureWhite"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 20)
                
                HStack{
                    Button(action: loginWithFB, label: {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(Color("PureWhite"))
                            .frame(width: 150)
                            .padding([.top, .bottom], 10)
                            .background(Color("BlueGray"))
                            .cornerRadius(8)
                        
                    })
                    
                    Button(action: loginWithTwitter, label: {
                        Text("Twitter")
                            .fontWeight(.bold)
                            .foregroundColor(Color("PureWhite"))
                            .frame(width: 150)
                            .padding([.top, .bottom], 10)
                            .background(Color("BlueGray"))
                            .cornerRadius(8)
                    })
                         
                }.frame(maxWidth: .infinity, alignment: .center)
                                          
            }.padding([.leading, .trailing], 20)
        }.padding(.top, 80)
        
        NavigationLink(destination: HomeView(), isActive: $isActiveHomeView) {
            EmptyView()
        }
       
    }
    func login() {
        let verifyUser = SaveData()
        if verifyUser.validateUser(email: email, password: password){
            isActiveHomeView = true
        }else{
            showAlert = true
        }
    }
    
}



func loginWithFB(){
    print("Inicio sesión con FB")
}

func loginWithTwitter(){
    print("Inicio sesión con Twitter")
}

struct RegisterView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    var body: some View{
        ScrollView{
            VStack{
                Text("Elige una foto de perfil")
                    .foregroundColor(Color("PureWhite"))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("Puedes cambiar o elegirla más adelante")
                    .foregroundColor(Color("LightGray"))
                    .font(.footnote)
                    .padding(.bottom, 24)
                    .opacity(0.5)
                
                Button(action: takePhoto, label: {
                    ZStack{
                        Image("PicturePerfil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 85, height: 85)
                            
                        Image(systemName: "camera")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color("PureWhite"))
                    }
                })
            }
            
            VStack(alignment: .leading) {
                    
                VStack(alignment: .leading){
                    Text("Correo electrónico")
                        .foregroundColor(Color("DarkCian"))
                    
                    ZStack(alignment: .leading) {
                        
                        if email.isEmpty{
                            Text(verbatim: "ejemplo@gmail.com")
                                .foregroundColor(Color("LightGray")
                                .opacity(0.7) )
                        }
                        TextField("", text: $email).foregroundColor(Color("PureWhite"))
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("DarkCian"))
                        .padding(.bottom, 36)
                    
                    Text("Contraseña").foregroundColor(Color("PureWhite"))
                    ZStack(alignment: .leading){
                        
                        if password.isEmpty{
                            Text("*******")
                                .foregroundColor(Color("LightGray")
                                .opacity(0.7))
                        }
                        SecureField("", text: $password)
                            .foregroundColor(Color("PureWhite"))
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("PureWhite"))
                        .padding(.bottom, 36)
                    
                    Text("Confirmar contraseña")
                        .foregroundColor(Color("PureWhite"))
                    ZStack(alignment: .leading){
                        
                        if confirmPassword.isEmpty{
                            Text("*******")
                                .foregroundColor(Color("LightGray")
                                .opacity(0.7))
                        }
                        SecureField("", text: $confirmPassword)
                            .foregroundColor(Color("PureWhite"))
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("PureWhite"))
                        .padding(.bottom, 36)
            }.padding([.leading, .trailing], 20)
                
                VStack{
                    Button(action: register, label: {
                        Text("REGÍSTRATE")
                            .foregroundColor(Color("PureWhite"))
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding([.top, .bottom], 12)
                            .overlay(RoundedRectangle(cornerRadius: 12.0).stroke(Color("DarkCian"), lineWidth: 1).shadow(color: Color("PureWhite"), radius: 6))
                    })
                        .padding(.bottom, 60)
                    
                    Text("Regístrate con redes sociales")
                        .foregroundColor(Color("PureWhite"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 20)
                    
                    HStack{
                        Button(action: loginWithFB, label: {
                            Text("Facebook")
                                .fontWeight(.bold)
                                .foregroundColor(Color("PureWhite"))
                                .frame(width: 150)
                                .padding([.top, .bottom], 10)
                                .background(Color("BlueGray"))
                                .cornerRadius(8)
                            
                        })
                        
                        Button(action: loginWithTwitter, label: {
                            Text("Twitter")
                                .fontWeight(.bold)
                                .foregroundColor(Color("PureWhite"))
                                .frame(width: 150)
                                .padding([.top, .bottom], 10)
                                .background(Color("BlueGray"))
                                .cornerRadius(8)
                        })
                             
                    }.frame(maxWidth: .infinity, alignment: .center)
                }.padding([.leading, .trailing], 20)
                                          
            }
        }.padding(.top, 50)
    }
    
    func register(){
        let registerUser = SaveData()
        
        if email.isEmpty || password != confirmPassword{
            print("campos vacios o las contraseñas no coinciden")
        }else{
            registerUser.saveData(email: email, password: password, name: email)
            
        }
    }
    
}

func takePhoto(){
    print("Tomar foto")
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
