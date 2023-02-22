//
//  Co2EmissionView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 22/02/23.
//

import SwiftUI

struct Co2EmissionView: View {
    @Binding var nextWindow: [Int]
    var body: some View {
        ZStack{
            Image("mainImage")
                .fixedSize()
                .ignoresSafeArea()
                .opacity(0.85)
            
            RoundedRectangle(cornerRadius: 20) .fill(Color(red: 255, green: 245, blue: 158, opacity: 0.403 )).frame(width: 350, height: 400)
            
            
            Text("Your estimated carbon footprint is \(co2) tons of Co2").multilineTextAlignment(.center).frame(width: 300).font(.largeTitle)
            
            RoundedRectangle(cornerRadius: 20).fill(.white).frame(width: 200, height: 80).offset(y:300)
            
            Button("Go on") {
                nextWindow.append(4)
            }.offset(y:300)
        }
    }
}

struct Co2EmissionView_Previews: PreviewProvider {
    static var previews: some View {
        Co2EmissionView(nextWindow: .constant([0]))
    }
}
