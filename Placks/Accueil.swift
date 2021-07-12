//
//  Accueil.swift
//  Placks
//
//  Created by Julien Heinen on 27/06/2021.
//

import SwiftUI

let myGray = Color(red: 173 / 255, green: 179 / 255, blue: 175 / 255)
let lightGray = Color(red: 220 / 255, green: 227 / 255, blue: 222 / 255)


struct Accueil: View {
    @Binding var selectedTab: String
    
    //Hidding Tab Menu....
    init(selectedTab: Binding<String>) {self._selectedTab = selectedTab
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        
        //Tab View with Tabs...
        TabView(selection: $selectedTab ){
            
            //Views...
            PageAccueil()
                .tag("Accueil")
            
            Historique()
                .tag("Historique")
            
            Paramètres()
                .tag("Paramètres")
            
            Aide()
                .tag("Aide")
           
            Notifications()
                .tag("Notifications")

        }
    }
}

struct Accueil_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}

//structur of the data (cards)
struct Box : Identifiable{
    var id: Int
    var imageUrl : String
}
//structur of the data (cards)
struct FriendBox : Identifiable{
    var id: Int
    let title : String
    var imageUrl : String
}

// cards features structurs
struct BoxView: View {
    
    let data : Box
    
    var body: some View{
        VStack{
            Button(action: {
                print("ok")
            }) {
                Image(self.data.imageUrl)
                    .resizable()
                    .frame(width: 90, height: 130)
                    .cornerRadius(20)
            }
   
        }
    }
}

// cards friends structurs
struct FriendsView: View {
    
    let friends : FriendBox
    
    var body: some View{
        VStack{
            Image(self.friends.imageUrl)
                .resizable()
                .frame(width: 90, height: 90)
                .cornerRadius(50)
            Text(self.friends.title)
                .font(.system(size: 12))
        }
        .padding(5)
    }
}

//All sub Views...
struct PageAccueil: View {
    let data:[Box] = [
        /* j'ai mis tes images et des textes au hasard mais tu peux changer comme tu veux*/
        Box(id: 1, imageUrl: "video-texte"),
        Box(id: 2, imageUrl: "Carte"),
        Box(id: 3, imageUrl: "Dictionnaire"),
        Box(id: 4, imageUrl: "texte-gestes")
        
    ]
    
    let friends:[FriendBox] = [
        /* j'ai mis tes images et des textes au hasard mais tu peux changer comme tu veux*/
        FriendBox(id: 1, title: "Julien Heinen", imageUrl: "userimage")
    ]
    
    var body: some View{
        ZStack{
            VStack{
                HStack(spacing: 70){
                    Spacer()
                    Text("Accueil")
                        .font(.system(size: 35))
                        .opacity(0.9)
                        .foregroundColor(Color.purple)
                        .multilineTextAlignment(.center)
                    HStack{
                        Image(systemName: "qrcode.viewfinder")
                            .resizable()
                            .frame(width: 27, height: 27)
                        
                        Image(systemName: "person.fill.viewfinder")
                            .resizable()
                            .frame(width: 27, height: 27)
                            .padding()
                    }
                    
                }
                .padding(.top, 70)
                .background(Color.white)
                
                ScrollView (.vertical, showsIndicators: false){
                    
                    
                    
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            // use the data to create cards
                            ForEach(data){ i in
                                BoxView(data: i)
                            }
                            .padding(5)
                            .padding(.top, 30)
                            .padding(.bottom, 10)
                        }
                        .padding(.leading, 40)
                    }
                    
                    
                    
                    HStack{
                        Text("Amis")
                            .font(.headline)
                            .padding(15)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .background(lightGray)
                    .opacity(0.7)
                    
                    
                    
                    ScrollView (.horizontal, showsIndicators: false){
                        HStack {
                            // use the data to create cards
                            ForEach(friends){ j in
                                FriendsView(friends: j)
                                
                            }
                            .padding(.top, 10)
                            .padding(.bottom, 10)
                        }
                        .padding(.leading, 36)
                    }
                }
                
                Spacer()
            }
            
            
        }
        .ignoresSafeArea()
    }
}
                    


struct Historique: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Historique")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Historique")
            
        }
    }
}

struct Notifications: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Notifications")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Notifications")
            
        }
    }
}

struct Paramètres: View {
    
    var body: some View{
        
    NavigationView{
            
            Text("Paramètres")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Paramètres")
            
        }
    }
}

struct Aide: View {
    
    var body: some View{
        
        NavigationView{
            
            Text("Aide")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(.primary)
                .navigationTitle("Aide")
            
        }
    }
}
