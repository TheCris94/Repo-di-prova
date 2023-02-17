//
//  SondaggioUIView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 17/02/23.
//

import SwiftUI

var demoData2 = ["One room", "Two rooms", "Three or more rooms", "I live in a mansion"]

struct SondaggioUIView: View {
    @State var selectKeeper = Set<String>()
    
    var body: some View {
        ZStack{
            
            Image("mainImage")
                .fixedSize()
                .ignoresSafeArea()
                .opacity(0.85)
            
           /*RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.712))
                .frame(width: 350, height: 300)*/
            
            TabView {
                
                //prima pagina
                VStack{
                    Text("How often do you fly?").offset(y:15).font(.system(size: 30))
                    
                    List(demoData, id: \.self, selection: $selectKeeper){ name in
                        Text(name)
                    }
                    // the next line is the modifier
                    .environment(\.editMode, .constant(EditMode.active))
                    
                }
                
                //seconda pagina
                VStack{
                    VStack{
                        Text("How big is your house?").offset(y:15).font(.system(size: 30))
                        
                        List(demoData2, id: \.self, selection: $selectKeeper){ name in
                            Text(name)
                        }
                        // the next line is the modifier
                        .environment(\.editMode, .constant(EditMode.active))
                        
                    }
                }
                
                //terza pagina
                VStack{
                    Text("Third")
                }
                
                //quarta pagina
                VStack{
                    Text("Fourth")
                }
                
                   }//fine della tabview
            .tabViewStyle(.page).background(Color(red: 0.97, green: 0.965, blue: 0.96, opacity: 0.791)).frame(width: 350, height: 400).cornerRadius(20)
            
            Text("Survey").fontWeight(.bold).foregroundColor(Color.white).offset(y:-300).font(.system(size: 36))
            
            RoundedRectangle(cornerRadius: 20).fill(.white).frame(width: 200, height: 80).offset(y:300)
            
            Button("Submit") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }.offset(y:300)
        }
        
    }
}

struct SondaggioUIView_Previews: PreviewProvider {
    static var previews: some View {
        SondaggioUIView()
    }
}
