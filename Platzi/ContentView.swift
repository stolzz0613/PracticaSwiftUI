//
//  ContentView.swift
//  Platzi
//
//  Created by Andres Julian Bustos Castelblanco on 24/08/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            
            Spacer()
            
            Color(red:19/255, green:30/255, blue:53/255, opacity:1.0).ignoresSafeArea()
            
            VStack {
                HStack {
                    Image("control").resizable().aspectRatio(contentMode: .fit).frame(width: 42).padding(.bottom, 42)
                    
                    Image("logo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                }
                
                InicioYRegistroView()
            }
        }
        
    }
}

struct InicioYRegistroView: View {
    
    @State var tipoInicioSesion = false
    
    var body: some View {
        
        VStack{
            
            HStack{
                Spacer()
                Button("INICIA SESIÓN"){
                    tipoInicioSesion = true
                    print("Pantalla inicio sesión")
                }.foregroundColor(tipoInicioSesion ? .white : . gray)
                
                Spacer()
                
                Button("REGÍSTRATE"){
                    tipoInicioSesion = false
                    print("Pantalla registro")
                }.foregroundColor(tipoInicioSesion ? .gray : . white)
                
                Spacer()
            }
            
            Spacer(minLength: 52)
            
            if tipoInicioSesion == true {
                InicioSesionView()
            } else {
                RegistroSesionView()
            }
        }
    }
}

func iniciarSesion() {
    print("Estoy Iniciando sesiòn")
}

struct InicioSesionView:View {
    
    @State var correo = ""
    @State var password = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Correo electrónico").foregroundColor(Color("dark-cian"))
                ZStack(alignment:.leading) {
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    TextField("", text: $correo)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                Text("Contraseña").foregroundColor(Color(.white))
                
                ZStack(alignment:.leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $password)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("dark-cian"))
                    .padding(.bottom)
                
                Text("Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("dark-cian"))
                    .padding(.bottom)
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity, alignment:.center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("dark-cian"), lineWidth: 3.0).shadow(color:.white, radius: 6))
                })
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .frame(maxWidth:.infinity, alignment:.center)
                    .padding(.bottom, 25)
                    .padding(.top, 80)
                
                HStack {
                    
                    Button(action: {print("a fb")}, label: {
                        Text("Facebook")
                            .foregroundColor(.white)
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: 125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(Color(.white).opacity(0.1))
                    }).cornerRadius(8.0)
                    
                    Button(action: {print("a fb")}, label: {
                        Text("Twitter")
                            .foregroundColor(.white)
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: 125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(Color(.white).opacity(0.1))
                    }).cornerRadius(8.0)
                    
                }
                
            }.padding(.horizontal, 77.0)
        }
    }
}

struct RegistroSesionView:View{
    
    @State var correo = ""
    @State var password = ""
    @State var rePassword = ""
    
    var body: some View{
        ScrollView {
            VStack(alignment:.center) {
                Text("Elije una foto de perfil")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o legirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: tomarFoto, label: {
                    ZStack{
                        Image("user")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                }).padding(.bottom, 20)
                
                
            }
            VStack {
                VStack(alignment: .leading) {
                    Text("Correo electrónico*")
                        .foregroundColor(Color("dark-cian"))
                        .fontWeight(.bold)
                        .frame(width: 300, alignment:.leading)
                    
                    ZStack(alignment:.leading) {
                        if correo.isEmpty {
                            Text("ejemplo@gmail.com")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        TextField("", text: $correo)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("dark-cian"))
                        .padding(.bottom)
                    
                    Text("Contraseña*")
                        .foregroundColor(Color("dark-cian"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    ZStack(alignment:.leading) {
                        if password.isEmpty {
                            Text("Escribe tu contraseña")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $password)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("dark-cian"))
                        .padding(.bottom)
                    
                    Text("Confirmar contraseña*")
                        .foregroundColor(Color("dark-cian"))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    ZStack(alignment:.leading) {
                        if rePassword.isEmpty {
                            Text("Escribe tu contraseña")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        
                        SecureField("", text: $rePassword)
                    }
                    
                    Divider()
                        .frame(height: 1)
                        .background(Color("dark-cian"))
                        .padding(.bottom, 40)
                }
                
                Button(action: iniciarSesion, label: {
                    Text("REGISTRATE")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.white)
                        .frame(maxWidth:.infinity, alignment:.center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0)
                                    .stroke(Color("dark-cian"), lineWidth: 3.0).shadow(color:.white, radius: 6))
                })
                
                Text("Registrate con redes sociales")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .frame(maxWidth:.infinity, alignment:.center)
                    .padding(.bottom)
                    .padding(.top, 30)
                
                HStack {
                    
                    Button(action: {print("a fb")}, label: {
                        Text("Facebook")
                            .foregroundColor(.white)
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: 125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(Color(.white).opacity(0.1))
                    }).cornerRadius(8.0)
                    
                    Button(action: {print("a fb")}, label: {
                        Text("Twitter")
                            .foregroundColor(.white)
                            .font(.caption)
                            .fontWeight(.bold)
                            .frame(maxWidth: 125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                            .background(Color(.white).opacity(0.1))
                    }).cornerRadius(8.0)
                    
                }
            }.padding(.horizontal, 77.0)
        }
    }
}

func tomarFoto() {
    print("Toma una foto")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
