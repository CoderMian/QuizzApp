//
//  Answere.swift
//  QuizzerApp
//
//  Created by devsaar on 29/06/2022.
//

import Foundation
struct Answer: Identifiable
{
    var id = UUID()
    var text: AttributedString
    var isCorrect:Bool = true
}

