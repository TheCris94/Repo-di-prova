//
//  NavLinkExample.swift
//  Biolyst
//
//  Created by cristianvaccarella on 18/02/23.
//

import SwiftUI

struct NavLinkExample: View {
    @State var nextWindow = [Int]()
    var body: some View {
        NavigationStack(path: $nextWindow){
            NavigationLink("primo link", value: 1)
            NavigationLink("secondo link", value: 2).navigationDestination(for: Int.self) { value in
                Text("Value is \(value)")
                Button("Navigate another page") {
                    nextWindow.append(Int.random(in: 0...100))
                }
            }
        }
    }
    
    struct NavLinkExample_Previews: PreviewProvider {
        static var previews: some View {
            NavLinkExample()
        }
    }
    
}
