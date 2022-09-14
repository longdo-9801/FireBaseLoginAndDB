//
//  AccountView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct AccountView: View {
    @State var userProfile = "A6MProfile"
    @State var userName = "NamelessONE"
    
    let color1 = Color(hue: 0.0858, saturation: 0.42, brightness: 0.93)
    let color2 = Color(hue: 0.8554, saturation: 0.72, brightness: 0.82)
    
    
    var body: some View {
        ZStack {
            //LinearGradient(colors:[Color(hue: 31, saturation: 42, brightness: 93), Color(hue: 308, saturation: 72, brightness: 82)], startPoint:.bottom, endPoint: .top)
            LinearGradient(gradient: Gradient(colors:[color1,color2]), startPoint:.bottomLeading, endPoint: .topTrailing)
            ScrollView {
                VStack {
                    //RoundView(icon : Image(userProfile)).offset(y: -50)
                        //.padding(.top, 70).padding(.bottom, -50)
                    Text(userName).font(.system(size: 25))
                    VStack {
                        NavigationLink {} label: {
                            //TableView(title: "Designer", content: "PLANEHOLDER")
                        }
                    }
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
