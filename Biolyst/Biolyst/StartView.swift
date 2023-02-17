//
//  StartView.swift
//  Biolyst
//
//  Created by mariabruno on 16/02/23.
//

import SwiftUI

struct StartView: View {
    @State var nextWindow = [Int]()
    var body: some View {
        NavigationStack(path: $nextWindow){
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
                        self.nextWindow.append(1)
                        
                    }
                    
                }
            }.navigationDestination(for: Int.self){
                i in   //qua sotto ci vanno le view del sondaggio
                Text("ciao")
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
