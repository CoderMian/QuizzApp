//
//  headView.swift
//  My_Quiz_App
//
//  Created by devsaar on 01/07/2022.
//

import SwiftUI

struct headView: View {
    @Environment(\.presentationMode) var dismiss
    var body: some View {
        
        HStack{
                Button{
                    dismiss.wrappedValue.dismiss()
                } label: {
                    Image("Back Arrow").font(.title)
                       
                        
                    Spacer()
                    Text("Pocket Guide")
                    
                        .font(Popins.regular.font(size: CustomFontsSize.medium))
                        .foregroundColor(.white)
                    Spacer()
                    
                }
        
            } .padding(.horizontal,20)
        
    
}

}
struct headView_Previews: PreviewProvider {
    static var previews: some View {
        headView()
    }
}
