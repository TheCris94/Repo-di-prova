//
//  Picker example.swift
//  Biolyst
//
//  Created by loriscatalano on 20/02/23.
//

import SwiftUI

struct Picker_example: View {

    @State var selected = 1
    var menu: [String] = ["Energy efficiency", "Water conservation", "Sustainable transportation", "Sustainable food choices", "Green purchasing", "Reduce chemical usage", "Support renewable energy", "Waste sorting", "Recycle plastic", "Saving trees", "Reduce packaging", "LED bulbs", "Planting plants", "Take care of animals", "Recycle old clothes", "Do plogging"]
    var body: some View {

        VStack{
            Picker(selection: $selected, label:
                    Text("Picker"), content: {
                Text ("All").tag(1)
                Text("Ongoing").tag(2)
            })
            .pickerStyle(SegmentedPickerStyle())

            if selected == 1 {
                List(0..<menu.count, id:\.self) { index in

                        Text(menu[index])
                         /*Text("Green purchasing")
                         Text("Reduce chemical usage")
                         Text("Support renewable energy")
                         Text("Waste sorting")
                         Text("Redycle plastic")
                         Text("Saving trees")
                         Text("Saving trees1")*/

                }
                }else{
                    List(0..<1) {item in
                        Text("Energy efficiency")
                        Text("Water concervation")
                        Text("Saving trees")
                    }
            }

        }
    }
}

struct Picker_example_Previews: PreviewProvider {
    static var previews: some View {
        Picker_example()
    }
}
