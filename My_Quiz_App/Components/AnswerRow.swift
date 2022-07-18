//
//  AnswerRow.swift
//  My_Quiz_App
//
//  Created by devsaar on 02/07/2022.
//

import SwiftUI
struct AnswereRow: View {
    @EnvironmentObject var fetchdata :fetchData
    var answere : Answer
    
    //Checking ismark null or ismark text not
    //null if null make it empty string
    //if not null check its equal to ans
    //if its equal make isSelected true or false
    var isSelected : Bool {fetchdata.isMarked?.text ?? "" == answere.text}
    
    var body: some View {
        VStack(spacing:0)
        {
            
            optionView(text1: fetchdata.optionNum(ans: answere), text2: answere.text)
                .background(isSelected ? .green:.white)
                .cornerRadius(CustomCornerRadius.large)
        }
        .padding(.top,10)
        .foregroundColor(.black)
        .cornerRadius(10)
        
    }
}

