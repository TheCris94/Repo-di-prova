//
//  ListChecks.swift
//  Biolyst
//
//  Created by cristianvaccarella on 17/02/23.
//

import SwiftUI

struct LabeledString: Hashable{
    var label: String
    var id: Int
}

//var demoData1 = Set<LabeledString>()


var demoData = ["Rarely or never", "Three/four times a year", "Once a month", "More"]


/*func aMethod() {
    var i = 0
    
    for aString in demoData {
        demoData1.insert(LabeledString(label: aString, id: i))
        i = i+1
    }
}*/

struct ListChecks : View {
    @State var selectKeeper = Set<String>()

    var body: some View {
        NavigationView {
            ZStack{
                List(demoData, id: \.self, selection: $selectKeeper){ name in
                    Text(name)
                }
                // the next line is the modifier
                .environment(\.editMode, .constant(EditMode.active))
                .navigationBarTitle(Text("Selection Demo \(selectKeeper.count)"))
                
                Text(selectKeeper.first ?? "")
                
            }
        }
       
    }
}
struct ListChecks_Previews: PreviewProvider {
    static var previews: some View {
        ListChecks()
    }
}
