//
//  MainView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 13/02/23.
//

import SwiftUI

struct MainView: View {
    @State var searchText: String
    @State private var selectedTab = "All"
    var tabs = ["All", "Ongoing"]
    
    var names = ["Energy efficiency", "Water conservation", "Sustainable transportation", "Sustainable food choices", "Green purchasing", "Reduce chemical usage", "Support renewable energy", "Waste sorting", "Recycle plastic", "Saving trees", "Reduce packaging", "LED bulbs", "Planting plants", "Take care of animals", "Recycle old clothes", "Do plogging"]
    
    var namesOngoing = ["Energy efficiency", "Water conservation", "Sustainable transportation", "Reduce packaging", "LED bulbs"]
    
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
            if selectedTab == "All" {
                NavigationView{
                    List{
                        ForEach(filtered, id:\.self){
                            name in
                            Text(name)
                        }
                    }.searchable(text: $searchText)
                }.frame(width: 393, height: 500).position(x: 190, y:400)
            } else {
                NavigationView{
                    List{
                        ForEach(filteredOngoing, id:\.self){
                            name in
                            Text(name)
                        }
                    }.searchable(text: $searchText)
                }.frame(width: 393, height: 500).position(x: 190, y:400)
            }
                
        }
    }
    
    var filtered: [String]{
        if searchText.isEmpty {
            return names
        }
        return names.filter({
            (nome: String) -> Bool in
            if nome.lowercased().contains(searchText.lowercased())
            {
                return true
            }else{ return false}
        })
    }
    
    var filteredOngoing: [String]{
        if searchText.isEmpty {
            return namesOngoing
        }
        return namesOngoing.filter({
            (nome: String) -> Bool in
            if nome.lowercased().contains(searchText.lowercased())
            {
                return true
            }else{ return false}
        })
    }
}
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView(searchText: "")
        }
    }
