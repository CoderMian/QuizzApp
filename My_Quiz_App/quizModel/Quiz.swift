//
//  Quiiz.swift
//  QuizzerApp
//
//  Created by devsaar on 29/06/2022.
//

import Foundation
import SwiftUI
struct Quiz : Decodable
{
    
    var results:[Result]
    struct Result:Decodable,Identifiable
    {
        var id:UUID
        {
            UUID()
        }
        var category:String
        var difficulty:String
        var question:String
        var correctAnswer:String
        var incorrectAnswers:[String]
        var formattedQuestion : AttributedString
        {
            do
            {
                return try AttributedString(markdown: question)
            }
            catch
            {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        var answere:[Answer]
        {
            do {
                let correct = [Answer(text: try AttributedString(markdown:correctAnswer), isCorrect:true)]
                let incorrects = try incorrectAnswers.map
                {answere in
                    Answer(text: try AttributedString(markdown:answere), isCorrect: false)
                }
                
                let allanswere = correct + incorrects
                return allanswere.shuffled()
            }
            catch
            {
                print("Error setting answere:\(error)")
                return []
            }
        }
    }
}
