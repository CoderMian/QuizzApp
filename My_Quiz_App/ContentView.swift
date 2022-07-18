//
//  ContentView.swift
//  My_Quiz_App
//
//  Created by devsaar on 01/07/2022.
//

import SwiftUI

struct ContentView: View {
    //make instance of obervable class
    @ObservedObject  var fetchdata = fetchData()
    
    var body: some View {
        
        VStack {
        if fetchdata.reachEnd
        {
    
            if fetchdata.score<=5
            {

                failView()
                    .environmentObject(fetchdata)
            }
            else
            
            {
               
                passView()
                    .environmentObject(fetchdata)
            }
            
            
        }
        else
        {
                quizView()
                .environmentObject(fetchdata)
            
        }
            
        }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
