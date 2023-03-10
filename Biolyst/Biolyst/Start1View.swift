//
//  Start1View.swift
//  Biolyst
//
//  Created by mariabruno on 17/02/23.
//

import SwiftUI

struct Start1View: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var nextWindow = [Int]()
    var body: some View {
        NavigationStack(path: $nextWindow){
            ZStack {
                Image("mainImage")
                    .fixedSize()
                    .ignoresSafeArea()
                    .opacity(0.85)
                Spacer()
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color.white)
                    .frame (width:370, height:730)
                    .opacity(0.60)
                
                
                RoundedRectangle(cornerRadius: 25, style:.continuous)
                    .fill(Color.white)
                    .frame (width:400, height:780)
                    .padding(.top, 75)
                
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width:104, height:97)
                    Text("Welcome in Biolyst")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    HStack {
                        Image("CO2")
                            .padding(.leading, -15)
                        Text("Calculate your carbon footprint")
                            .font(.headline)
                    }
                    HStack {
                        Image("Tree")
                            .padding(.leading, -72)
                        Text("Find out how to reduce\n your emissions")
                            .font(.headline)
                            .multilineTextAlignment(.leading)
                        
                    }
                    
                    HStack{
                        Image("Leaf")
                            .padding(.leading, -39.0)
                        Text("Keep track of your progress")
                            .font(.headline)
                    }
                    Button("Continue"){
                        self.nextWindow.append(1)
                    } .offset(y:100)
                        .foregroundColor(.white)
                        .buttonStyle(.bordered)
                        .tint(Color(hue: 0.398, saturation: 0.629, brightness: 0.63, opacity: 10))
                }
                
            }.navigationDestination(for: Int.self){
                i in
                switch i {
                case 1:
                    StartView(nextWindow: $nextWindow)
                case 2:
                    SondaggioUIView(nextWindow: $nextWindow)
                case 3:
                    Co2EmissionView(nextWindow: $nextWindow)
                case 4:
                    MainView(nextWindow: $nextWindow, searchText: "")
                    //self.presentationMode.wrappedValue.dismiss()
                default:
                    Text("dsas")
                }
            }
            
            
        }
        
    }
}

    
    
    struct Start1View_Previews: PreviewProvider {
        static var previews: some View {
            Start1View()
        }
    }
    
    
    


