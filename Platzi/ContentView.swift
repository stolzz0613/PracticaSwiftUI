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
    
    @State var tipoInicioSesion = true
    
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
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                InicioSesionView()
            } else {
                RegistroSesionView()
            }
        }
    }
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
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }

                    TextField("", text: $correo)
                }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Contraseña").foregroundColor(Color(.white))
                ZStack(alignment:.leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }

                    SecureField("", text: $password)
                }
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Text("Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing).foregroundColor(Color("dark-cian"))
                
            }.padding(.horizontal, 77.0)
        }
    }
}

struct RegistroSesionView:View{
    var body: some View{
        Text("Soy la vista de Registro")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
