//
//  StartView.swift
//  Biolyst
//
//  Created by mariabruno on 16/02/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        ZStack{
              Image("mainImage")
                    .fixedSize()
                    .ignoresSafeArea()
                    .opacity(0.85)
                    
            VStack{
                  Text("BIOLYST")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                  Button("Calculate your Carbon footprint"){
                      /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                      
                      
                  }
                    
                
                }
            }
        }
    }

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
