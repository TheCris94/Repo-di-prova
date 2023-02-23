//
//  SondaggioUIView.swift
//  Biolyst
//
//  Created by cristianvaccarella on 17/02/23.
//

import SwiftUI

var demoData2 = ["One room", "Two rooms", "Three or more rooms", "I live in a mansion"]

var demoData3 = ["Yes, I do", "I often do it", "I rarely do it", "No, I don't"]

var demoData4 = ["Bycicle", "Public transports", "Hybrid or electric car", "Other type of car"]



var co2 = Double(0)

struct SondaggioUIView: View {
    @Binding var nextWindow: [Int]
    @State var selectKeeper1 = Set<String>()
    @State var selectKeeper2 = Set<String>()
    @State var selectKeeper3 = Set<String>()
    @State var selectKeeper4 = Set<String>()
    
    
    func GetData1() -> Int{
        let innerString = selectKeeper1.first
        switch innerString{
        case "Rarely or never":
            return 1
        case "Three/four times a year":
            return 2
        case "Once a month":
            return 3
        case "More":
            return 4
        default:
            return 0
        }
    }
    
    func GetData2() -> Int{
        let innerString = selectKeeper2.first
        switch innerString{
        case "One room":
            return 1
        case "Two rooms":
            return 2
        case "Three or more rooms":
            return 3
        case "I live in a mansion":
            return 4
        default:
            return 0
        }
    }
    func GetData3() -> Int{
        let innerString = selectKeeper3.first
        switch innerString{
        case demoData3[0]:
            return 1
        case demoData3[1]:
            return 2
        case demoData3[2]:
            return 3
        case demoData3[3]:
            return 4
        default:
            return 0
        }
    }
    func GetData4() -> Int{
        let innerString = selectKeeper4.first
        switch innerString{
        case demoData4[0]:
            return 1
        case demoData4[1]:
            return 2
        case demoData4[2]:
            return 3
        case demoData4[3]:
            return 4
        default:
            return 0
        }
    }
    
    
    func magicAlgorithm() -> Double{
        return Double((self.GetData1() + self.GetData2() + self.GetData3() + self.GetData4())) * 0.4
    }
    
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
                        
                        List(demoData, id: \.self, selection: $selectKeeper1){ name in
                            Text(name)
                        }
                        // the next line is the modifier
                        .environment(\.editMode, .constant(EditMode.active))
                        
                    }
                    
                    //seconda pagina
                    VStack{
                        VStack{
                            Text("How big is your house?").offset(y:15).font(.system(size: 30))
                            
                            List(demoData2, id: \.self, selection: $selectKeeper2){ name in
                                Text(name)
                            }
                            // the next line is the modifier
                            .environment(\.editMode, .constant(EditMode.active))
                            
                        }
                    }
                    
                    //terza pagina
                    VStack{
                        Text("Do you recycle?").offset(y:15).font(.system(size: 30))
                        
                        List(demoData3, id: \.self, selection: $selectKeeper3){ name in
                            Text(name)
                        }
                        // the next line is the modifier
                        .environment(\.editMode, .constant(EditMode.active))
                        
                    }
                    
                    //quarta pagina
                    VStack{
                        Text("What transport do you use the most?").offset(y:15).font(.system(size: 21))
                        
                        List(demoData4, id: \.self, selection: $selectKeeper4){ name in
                            Text(name)
                        }
                        // the next line is the modifier
                        .environment(\.editMode, .constant(EditMode.active))
                    }
                    
                }//fine della tabview
                .tabViewStyle(.page).background(Color(red: 0.97, green: 0.965, blue: 0.96, opacity: 0.791)).frame(width: 350, height: 400).cornerRadius(20)
                
                Text("Survey").fontWeight(.bold).foregroundColor(Color.white).offset(y:-300).font(.system(size: 36))
                
                RoundedRectangle(cornerRadius: 20).fill(.white).frame(width: 200, height: 80).offset(y:300)
                
                Button("Submit") {
                    co2 = self.magicAlgorithm()
                    nextWindow.append(3)
                }.offset(y:300)
                
                
            }/*.navigationDestination(for: Int.self){
                i in   //qua sotto ci vanno le view del sondaggio
                
                Text("ciao \(self.magicAlgorithm())").offset(y:150)
                
            }*/
        }
        
    }

    struct SondaggioUIView_Previews: PreviewProvider {
        static var previews: some View {
            SondaggioUIView(nextWindow: .constant([0]))
        }
    }

