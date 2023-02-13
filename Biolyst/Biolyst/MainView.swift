//
//  MainView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 13/02/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{ //stack dell'immagine di copertina
            Image("mainImage").resizable().frame(width: 393, height: 200).ignoresSafeArea()
                .overlay(HStack{
                    Text("BIOLYST").font(.system(size: 30)).fontWeight(.bold).foregroundColor(.white)
                }.position(x:110, y:75))
            Spacer()
        }//modifica per git
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
