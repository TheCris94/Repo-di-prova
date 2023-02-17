//
//  SondaggioUIView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 17/02/23.
//

import SwiftUI

struct SondaggioUIView: View {
    var body: some View {
        ZStack{
            Image("mainImage")
                .fixedSize()
                .ignoresSafeArea()
                .opacity(0.85)
            
           RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.712))
                .frame(width: 350, height: 300)
            
            
            
            ScrollView {
                Text("How often you fly?").fontWeight(.bold).offset(x:0, y:-10).font(.system(size: 30))
                ForEach(0..<100) { i in
                    Text("Item \(i)")
                }
            }.frame(width: 500, height: 200)
            
        }
    }
}

struct SondaggioUIView_Previews: PreviewProvider {
    static var previews: some View {
        SondaggioUIView()
    }
}
