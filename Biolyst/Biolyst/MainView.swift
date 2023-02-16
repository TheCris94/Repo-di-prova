//
//  MainView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 13/02/23.
//

import SwiftUI

struct MainView: View {
    @State var searchText = ""
    @State private var selectedTab = "All"
    var tabs = ["All", "Ongoing"]
    
    var names = ["Energy eff", "water conse", "sustainable trans"]
    
    var body: some View {
        ZStack{
            VStack{ //stack dell'immagine di copertina
                Image("mainImage").resizable().frame(width: 393, height: 200).ignoresSafeArea().opacity(0.85)
                    .overlay(HStack{
                        Text("BIOLYST").font(.system(size: 30)).fontWeight(.bold).foregroundColor(.white)
                    }.position(x:110, y:75))
                Spacer()
            }
            Picker("", selection: $selectedTab){
                    ForEach(tabs, id: \.self) {
                        Text($0)
                    }
            }
                .pickerStyle(.segmented)
                .background (
                    RoundedRectangle(cornerRadius:8)
                        .fill (Color.accentColor)
                    )
                .position(x:200,  y:120)
            
            List(0..<3, id: \.self) { index in
                Text(names[index])
            }.frame(width: 393, height: 500).position(x: 190, y:450).searchable(text: $searchText)
            
                
        }
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView(searchText: "")
        }
    }
}
