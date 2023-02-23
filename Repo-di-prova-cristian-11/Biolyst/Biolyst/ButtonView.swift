//
//  ButtonView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 17/02/23.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack{
            Text("BIOLYST")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.black).position(x:200, y:350)
            Spacer()
            
            Button("Calculate your Carbon footprint"){
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/

            }.foregroundColor(.black)
            
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
