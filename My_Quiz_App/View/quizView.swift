//
//  quizView.swift
//  My_Quiz_App
//
//  Created by devsaar on 01/07/2022.
//

import SwiftUI

struct quizView: View {
    
    @EnvironmentObject  var fetchdata :fetchData
    var body: some View {
        VStack(spacing:0)
        {
            headView()
            Spacer()
            
            VStack(spacing:5)
            {
                Text("Question \(fetchdata.index + 1) / \(fetchdata.length)")
                    .font(Popins.semibold.font(size: CustomFontsSize.regular))
                    .foregroundColor(.black)
                    .padding(.top,20)
                
                Text(fetchdata.question)
                    .font(Popins.regular.font(size: CustomFontsSize.small))
                    .foregroundColor(.black)
                    .frame(alignment: .leading)
                    .padding()
                
                //Calling foreach for ansere
                ForEach(fetchdata.answereChoices ,id:\.id)
                {data in
                    AnswereRow(answere:data)
                        .onTapGesture {
                            fetchdata.isMarked = data
                            //                            print("taped")
                            //                            print(fetchdata.isMarked)
                        }
                        .environmentObject(fetchdata)
                    
                }
                
                Spacer()
            }
            .frame(width:339,height:545)
            .background(.white)
            .cornerRadius(CustomCornerRadius.large)
            
            Spacer()
            Button
            {
                fetchdata.AnswereArray.append(fetchdata.isMarked!)
                fetchdata.goToNextQuestion()
                fetchdata.selectAnswere(answere: fetchdata.isMarked!)
                fetchdata.isMarked = nil
            } label:
            {
                Text("Submit")
                    .frame(width: 193 , height: 54)
                    .background(LinearGradient(gradient: Gradient(colors: [Color("gradient2"), Color("gradient1")]), startPoint: .leading, endPoint: .trailing))
                
                    .cornerRadius(CustomCornerRadius.exSmall)
                    .foregroundColor(.white)
                    .font(Popins.regular.font(size:CustomFontsSize.medium))
                    .shadow(color:.gray , radius:0.04, x:0, y: 4)
                
            }.disabled(fetchdata.isMarked == nil)
            
            Spacer()
            
        }
        
        .frame(maxWidth:.infinity, maxHeight:.infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color("gradient1"), Color("gradient2")]), startPoint: .top, endPoint: .bottom))
        
        
    }
}

struct quizView_Previews: PreviewProvider {
    static var previews: some View {
        quizView()
          

    }
}
