//
//  ContentView.swift
//  WearablesMiniApp-JonathanK Watch App
//
//  Created by Jonathan Kearns on 2/16/23.
//

import SwiftUI


struct ContentView: View {
    
// -------------------- VARIABLES --------------------------
    
    @State var switchView = false
    @Namespace var animation

    
    static let fortune = ["Looks Good", "Probably Not", "No", "Yes", "Ask Again Later", "Without a Doubt", "Signs Point to Yes", "Don't Count On It", "You Go, Girl!", "I could tell you but...", "Hmm Not Sure", "(sigh) can you ask a friend?", "listen, I don't know the future", "Flip a coin", "Just chill, pal", "Is is that important?", "All signs point to fun!", "👍", "👎", "Quick! Duck!", "Now is not later.", "Go for it!", "I'd take a pass"]
    

    
    @State var fortuneText = ""
    @State var eightball = Image(systemName: "08.circle")
    @State var thisTriangle = Image(systemName: "triangle")

// -------------------------------------------------------------
        
    var body: some View {
        VStack {
            
            if switchView{
                fortuneView
            } else {
                startView
            }
            
            
        }
    }
        
        
// ----------------------- START VIEW ----------------------------
        
        var startView: some View{
            
            VStack {
                ZStack {
                    
                    Image(systemName: "circle")
                        .resizable()
                        .frame(width: 250, height: 250.0)
                        .foregroundColor(.accentColor)
        
                    
                    eightball
                        .resizable()
                        .matchedGeometryEffect(id: "8ball", in: animation)
                        .frame(width: 130, height: 130)
                        .padding(.bottom)
                        
                        .onTapGesture {
                            withAnimation(.spring()){
                                switchView.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now()+2){
                                    withAnimation(.spring()){
                                        switchView.toggle()
                                    }
                                }
                            }
                            
                        }
                    
                    Text(fortuneText)
                        .foregroundColor(.blue)

                }
               
            }
            .padding()
        }

    
//    ------------------- FORTUNE VIEW --------------------------
    
    var fortuneView: some View {
        VStack {
            ZStack {
                
                Image(systemName: "circle")
                    .resizable()
                
                    .frame(width: 250, height: 250.0)
                    .foregroundColor(.accentColor)
                
                Image(systemName: "triangle")
                    .resizable()
                    .matchedGeometryEffect(id: "8ball", in: animation)
                    .frame(width: 150, height: 150.0)
                    .foregroundColor(.purple)
                
//                eightball
//                    .resizable()
//                    .frame(width: 150, height: 150)
//                    .padding(.bottom)
                
                Text(Self.fortune.randomElement()!)
                    .fontWeight(.ultraLight)
                    .foregroundColor(.blue)
                    .multilineTextAlignment(.center)
                    .lineLimit(5)
                    .padding(.top, 25.0)
                    .frame(maxWidth: 65)
            }
        }
        .padding()
    }
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

