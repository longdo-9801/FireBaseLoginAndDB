//
//  TableView.swift
//  Assignment1
//
//  Created by Flynn Pham on 06/08/2022.
//
import SwiftUI

struct TableView : View {
    
    let title: String
    let content: String
    
    var body: some View {
        Rectangle().fill(Color.white)
            .frame(width: 300, height: 50.0)
            .overlay( HStack{
                Spacer()
                Text(title + ": ")
                Spacer()
                Text(content)
                Spacer()
            }
            )
    }
}

struct TableViewPreview: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            TableView(title: "AAAA", content: "BBB")
        }
        
    }
}
