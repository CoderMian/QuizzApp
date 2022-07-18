//
//  optionView.swift
//  My_Quiz_App
//
//  Created by devsaar on 02/07/2022.
//

import SwiftUI

struct optionView: View {
    var text1 :  AttributedString
    var text2 : AttributedString

    var body: some View {
        HStack
        {
        Text(text1)
            .font(Popins.medium.font(size: CustomFontsSize.regular))
            .padding()
            
        Text(text2)
            .font(Popins.semibold.font(size: CustomFontsSize.regular))
              
        }.frame(width:280,alignment:.leading )
            
            .overlay(
                RoundedRectangle(cornerRadius: CustomCornerRadius.large)
                    .stroke(Color.black, lineWidth: 1)
                )
            .cornerRadius(CustomCornerRadius.medium)
        
        
        
    }
}

//struct optionView_Previews: PreviewProvider {
//    static var previews: some View {
//        optionView(text1:"A.", text2: "Imran Khan")
//    }
//}
