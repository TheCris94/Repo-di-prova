//
//  MainView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 13/02/23.
//

import SwiftUI

struct MainView: View {
    @Binding var nextWindow: [Int]
    @State var searchText: String
    @State private var selectedTab = "All"
    var tabs = ["All", "Ongoing"]
    
    /*var names = ["Energy efficiency", "Water conservation", "Sustainable transportation", "Sustainable food choices", "Green purchasing", "Reduce chemical usage", "Support renewable energy", "Waste sorting", "Recycle plastic", "Saving trees", "Reduce packaging", "LED bulbs", "Planting plants", "Take care of animals", "Recycle old clothes", "Do plogging"]
    
    var namesOngoing = ["Energy efficiency", "Water conservation", "Sustainable transportation", "Reduce packaging", "LED bulbs"]*/
    
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
                .position(x:183,  y:120)
                .frame(width:370)
            if selectedTab == "All" {
                NavigationView{
                    List{
                        ForEach(filtered){
                            act in
                            //Text(name)
                            NavigationLink(act.name) {
                                ZStack{
                                        Image("mainImage")
                                            .fixedSize()
                                            .ignoresSafeArea()
                                            .opacity(0.85)
                                   
                                     Image(act.image).resizable().frame(width: 393, height: 540)
                                    
                                    VStack{
                                        Text(act.name).font(.system(size: 30, weight: .bold)) .foregroundColor(Color.white)
                                            .frame(width: 350)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                        
                                        Text(act.details).font(.system(size: 20, weight: .light)).foregroundColor(Color.white)
                                            .minimumScaleFactor(0.5).frame(width:350, height: 200).offset(x:6)
                                        RoundedRectangle(cornerRadius: 30).fill(Color.white.opacity(0.5)).frame(width: 300, height: 120).offset(x:3,y:10)
                                    }
                                    Text("Analytics").font(.system(size: 18, weight: .light))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.black)
                                        .offset(y:100)
                                    AnaliticView(isOngoing: act.is_ongoing, date: act.date)
                                    AddRemoveView(is_ongoing: act.is_ongoing, act: act)
                                    /*
                                    if(act.is_ongoing == true){
                                        Button("Remove") {
                                            act.set_Ongoing(booleano: false)
                                        }.offset(y: 300).foregroundColor(.white)
                                            .buttonStyle(.bordered)
                                            .tint(Color(.red))
                                    }
                                    else{
                                        Button("Add") {
                                            act.set_Ongoing(booleano: true)
                                        }.offset(y: 300).foregroundColor(.white)
                                            .buttonStyle(.bordered)
                                            .tint(Color(hue: 0.398, saturation: 0.629, brightness: 0.63, opacity: 45))
                                    }
                                    */
                                }
                            }
                        }
                    }.searchable(text: $searchText)
                }.frame(width: 397.0, height: 580).position(x: 197, y:431)
                
                Text("Your estimated Co2 emission is \(co2) tons").fontWeight(.light).offset(y:375)
                
            } else {
                
                // COPIA E INCOLLA DA SOPRA
                NavigationView{
                    List{
                        ForEach(filteredOngoing){
                            act in
                            //Text(name)
                            NavigationLink(act.name) {
                                ZStack{
                                        Image("mainImage")
                                            .fixedSize()
                                            .ignoresSafeArea()
                                            .opacity(0.85)
                                   
                                    Image(act.image).resizable().frame(width: 393, height: 540)
                                    
                                    VStack{
                                        Text(act.name).font(.system(size: 30, weight: .bold)) .foregroundColor(Color.white)
                                            .frame(width: 350)
                                            .lineLimit(1)
                                            .minimumScaleFactor(0.5)
                                        
                                        Text(act.details).font(.system(size: 20, weight: .light)).foregroundColor(Color.white)
                                            .minimumScaleFactor(0.5).frame(width:350, height: 200).offset(x:6)
                                        RoundedRectangle(cornerRadius: 30).fill(Color.white.opacity(0.5)).frame(width: 300, height: 120).offset(x:3,y:10)
                                    }
                                    Text("Analytics").font(.system(size: 18, weight: .light))
                                        .fontWeight(.regular)
                                        .foregroundColor(Color.black)
                                        .offset(y:100)
                                    AnaliticView(isOngoing: act.is_ongoing, date: act.date)
                                    AddRemoveView(is_ongoing: act.is_ongoing, act: act)
                                    
                                    /*
                                    if(act.is_ongoing == true){
                                        Button("Remove") {
                                            act.set_Ongoing(booleano: false)
                                        }.offset(y: 300).foregroundColor(.white)
                                            .buttonStyle(.bordered)
                                            .tint(Color(.red))
                                    }
                                    else{
                                        Button("Add") {
                                            act.set_Ongoing(booleano: true)
                                        }.offset(y: 300).foregroundColor(.white)
                                            .buttonStyle(.bordered)
                                            .tint(Color(hue: 0.398, saturation: 0.629, brightness: 0.63, opacity: 45))
                                    }
                                    */
                                }
                            }
                        }
                    }.searchable(text: $searchText)
                }.frame(width: 397.0, height: 580).position(x: 197, y:431)
            }
                
        }.navigationBarBackButtonHidden(true)
    }
    
    /*
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
    }   OLD SYSTEM */
    
    var filtered: [Activity]{
        if searchText.isEmpty {
            /*var activities_names: [String] = []
            for act in activities{
                activities_names.append(act.name)
            }  Strunzata */
            return activities
        }
        
        return activities.filter({
            (act: Activity) -> Bool in
            if act.name.lowercased().contains(searchText.lowercased())
            {
                return true
            }else{ return false}
        })
    }
    
    var filteredOngoing: [Activity]{
        var ongoingActivities: [Activity] = []
        
        // filter for the activities array, including only the ongoing ones
        ongoingActivities = activities.filter({
            (act: Activity) -> Bool in
            if act.is_ongoing == true
            {
                return true
            }else{ return false}
        })
        
        if searchText.isEmpty {
            return ongoingActivities
        }
        return ongoingActivities.filter({
            (act: Activity) -> Bool in
            if act.name.lowercased().contains(searchText.lowercased())
            {
                return true
            }else{ return false}
        })
    }
}
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView(nextWindow: .constant([0]), searchText: "")
        }
    }


struct AnaliticView: View {
    @State var isOngoing = false
    @State var date = "1900"
    var body: some View {
        VStack{
            if(isOngoing == true){
                Text(date).font(.system(size: 18, weight: .light))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .offset(y:130)
            }
            else{
                Text("You have not started this activity yet").font(.system(size: 18, weight: .light))
                    .fontWeight(.regular)
                    .foregroundColor(Color.black)
                    .offset(y:130)
                
                
            }
        }
    }
}


struct AddRemoveView: View{
    @State var is_ongoing:Bool
    @State var act:Activity

    var body: some View{
        if(is_ongoing == true){
            Button("Remove") {
                act.set_Ongoing(booleano: false)
            }.offset(y: 300).foregroundColor(.white)
                .buttonStyle(.bordered)
                .tint(Color(.red))
        }
        else{
            Button("Add") {
                act.set_Ongoing(booleano: true)
            }.offset(y: 300).foregroundColor(.white)
                .buttonStyle(.bordered)
                .tint(Color(hue: 0.398, saturation: 0.629, brightness: 0.63, opacity: 45))
        }
    }
}


