//
//  ContentView.swift
//  Urhobo_Game_V2
//
//  Created by Ufuoma Okoro on 13/12/2019.
//  Copyright © 2019 Ufuoma Okoro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
      @State private var naijaObject = ["books", "dog", "leg","elephant","cat","turtile","hair","snake","monkey","water","star","house","eye","knife","hand","mouth","teeth","fork","spoon","rabbit","sun","shoes"].shuffled()
      
      //Display the
      
      @State private var correctAnswer = Int.random(in: 0...2)
      
      
      //Translate Correct answer into Urhobo
      
      var processCorrectAnswer: String {
          
          var translateSselection = ""
          
          switch (naijaObject[correctAnswer]) {
              
          case "turtile":
              translateSselection = "Ogbeni"
              
          case "books":
              translateSselection = "Obe"
              
          case "fork":
              translateSselection = "Kpagheghe"
              
          case "leg":
              translateSselection = "Owo"
              
          case "snake":
              translateSselection = "Odeko"
              
          case "cat":
              translateSselection = "Ologbo"
              
          case "hair":
              translateSselection = "Eto"
              
          case "monkey":
              translateSselection = "Okpe"
              
          case "spoon":
              translateSselection = "Kujere"
              
          case "water":
              translateSselection = "Ame"
              
          case "dog":
              translateSselection = "Eranko"
              
          case "hand":
              translateSselection = "Oboh"
              
          case "mouth":
              translateSselection = "Ugbunu"
              
          case "star":
              translateSselection = "Isio"
              
          case "elephant":
              translateSselection = "Eni"
              
          case "house":
              translateSselection = "Uwenwi"
              
          case "rabbit":
              translateSselection = "Afioto"
              
          case "sun":
              translateSselection = "Oren"
              
          case "eye":
              translateSselection = "Ero"
              
          case "knife":
              translateSselection = "Aphia"
              
          case "shoes":
              translateSselection = "Sabatu"
              
          case "teeth":
              translateSselection = "Aku"
          default:
              translateSselection = "No Title"
          }
          
      
          
          
          return translateSselection
      }
      //Score action on picture selection
      @State private var score = 0
      @State private var alertTitle = ""
      @State private var showAlert = false
    
    
    
    var body: some View {
        NavigationView {
                
                    ZStack {
                        
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                        
                  
                        VStack {
                                
                                Text("Tap Correct Image")
                                    .font(.headline)
                                    .foregroundColor(Color.blue)
                    
                            
                            ForEach((0...2), id: \.self) { number in
                        
                                Image(self.naijaObject[number])
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .border(Color.black,width: 1)
                                    .transition(.slide)
                                    .animation(.easeInOut(duration: 1))
                                    .onTapGesture {
                                        self.pictureTapped(number)
                                }
                            
                           
                            }
                                
                           
                            .navigationBarTitle(Text(processCorrectAnswer))
                            .alert(isPresented: $showAlert) {
                                Alert(title: Text("\(alertTitle), Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                                    self.askQuestion()
                                })
                            }
                        }//End of VStack
                    
                    }//End of
            
                } //End of Naviagtion View
                
            
            } //End of View
            
            //Function to action which object is tapped
                   func pictureTapped(_ tag: Int) {
                       if tag == correctAnswer {
                           
                        score += 1
                        alertTitle = "Correct"
                       } else {
                           
                        score -= 1
                        alertTitle = "Wrong"
                       }
                    showAlert = true
                   }
            
            //Function to continue the game
            func askQuestion() {
                naijaObject.shuffle()
                correctAnswer = Int.random(in: 0...2)
            }
        }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
