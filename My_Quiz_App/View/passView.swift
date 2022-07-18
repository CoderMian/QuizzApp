//
//  passView.swift
//  My_Quiz_App
//
//  Created by devsaar on 02/07/2022.
//

import SwiftUI

struct passView: View {
    @EnvironmentObject var fetchdata:fetchData
    var body: some View {
        
        VStack(spacing:0)
        {
          headView()
            Spacer()
            
            VStack(spacing:20)
            {
               Text("You Are Passed")
                    .font(Popins.semibold.font(size: CustomFontsSize.regular))
                    .foregroundColor(.black)
                    .padding(.top,70)
                   Image("pass")
                    .padding(.trailing)
                Text("Score:\(fetchdata.score)")
                    .font(Popins.semibold.font(size: CustomFontsSize.regular))
              
                Spacer()
            }
            .frame(width:deviceWidth-70, height: deviceHeight-350)
            .background(.white)
            .cornerRadius(CustomCornerRadius.large)
            Spacer()
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
      
    }
}

struct passView_Previews: PreviewProvider {
    static var previews: some View {
        passView()
    }
}
