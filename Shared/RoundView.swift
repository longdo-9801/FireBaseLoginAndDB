/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Do Ha Minh Long
  ID: s3634734
  Created  date: 13/09/2022
  Last modified: 13/09/2022
  Acknowledgement:
    Reused from Assignment 1
*/
import SwiftUI

struct RoundView : View {
    var icon : Image
    
    var body: some View {
        ZStack {
            icon.clipShape(Circle()).background(Circle().foregroundColor(Color.white))
            icon.clipShape(Circle()).overlay(Circle().stroke(Color.black,lineWidth: 4)).shadow(radius: 10)
        }
        
        
    }
}

struct RoundViewPreview : PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            RoundView(icon: Image("A6MProfile"))
        }
        
    }
}
