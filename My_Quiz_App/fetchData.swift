//
//  Quizz_manager.swift
//  QuizzerApp
//
//  Created by devsaar on 29/06/2022.
//

import Foundation
import SwiftUI
class fetchData : ObservableObject
{
    @Published   var optionMention : [AttributedString]=["A.","B.","C. ","D.","E","F"]
    @Published private(set) var length = 0
    @Published private (set) var index = 0
    @Published private(set) var reachEnd = false
//    @Published private (set) var answereSelected = false
    @Published private (set) var question: AttributedString = ""
    @Published var answereChoices:[Answer] = []
    //    @Published private (set) var progress : CGFloat = 0.00
    @Published private (set)  var score = 0
    @Published  var  isMarked:Answer?
    @Published  var AnswereArray:[Answer] = []
    @Published   var count = 0
//    @Published   var optionMention : [AttributedString]=["A.","B.","C. ","D."]
    private(set) var quiz: [Quiz.Result] = []
    
    init()
    {
        Task.init
        {
            await fetchQuizz()
        }
    }
    
    
    
    func fetchQuizz()
    async {
        guard let url = URL(string:"https://opentdb.com/api.php?amount=20")else{fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        do
        {
            let (data,response) = try await URLSession.shared.data(for:urlRequest)
            
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else {
                fatalError("Error while fetching data")
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Quiz.self, from: data)
            
            DispatchQueue.main.async
            {
                self.index = 0
                self.score = 0
                self.reachEnd = false
                self.quiz = decodedData.results
                self.length = self.quiz.count
                self.setQuestion()
            }
        }
        catch
        {
            print("Error fetching: \(error)")
        }
    }
    
    func selectAnswere(answere:Answer)
    {
        
        if(answere.isCorrect)
        {
            score += 1
        }
                
    }
    
    func goToNextQuestion()
    {
        if index + 1 < length
        {
            index += 1
            count = 0
            //Setting new question here...
            setQuestion()
        }
        else
        {
            reachEnd =  true
        }
    }
    
    func setQuestion()
    {
        
        //        progress = CGFloat (Double(index + 1) / Double(length) * 350)
        
        if index < length
        {
            let currentQuizQuestion = quiz[index]
            question = currentQuizQuestion.formattedQuestion
            answereChoices = currentQuizQuestion.answere
            
        }
    }
    func optionNum(ans:Answer)-> AttributedString
    {
//        count = count+1
        
        var arrayIndex = 0
        
        for data in answereChoices {
//            arrayIndex+=1
            if data.text == ans.text {
               
              break
                
            }
            arrayIndex+=1
        }
      

        return optionMention[arrayIndex]
        
    
}
}
