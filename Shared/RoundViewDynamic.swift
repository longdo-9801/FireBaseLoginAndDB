//
//  RoundViewDynamic.swift
//  canteenApp
//
//  Created by Long, Do Ha Minh on 16/09/2022.
//

import SwiftUI

struct RoundViewDynamic: View {
    @Binding var name : String
    
    var body: some View {
        ZStack {
            Circle().fill(Color.mint).frame(width: 80, height: 80, alignment: .center)
                .overlay(Circle().stroke(Color.black,lineWidth: 4)).shadow(radius: 10)
            Text(String(name.prefix(1).uppercased()))
                .font(.system(size: 50)).foregroundColor(Color.white)

            
        }
    }
}

struct RoundViewDynamic_Previews: PreviewProvider {
    @State static var name1 = "SS"
    @State static var name2 = "alice"
    @State static var name3 = "onYan"
    
    static var previews: some View {
        VStack {
            RoundViewDynamic(name: $name1)
            RoundViewDynamic(name: $name2)
            RoundViewDynamic(name: $name3)
        }
    }
}
