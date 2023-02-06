/*
 Assignment 1 – Slot Machine App - Part 2 : App UI
Group No 03
Author's name and StudentID:
1. Deepak Sardana
 Student ID: 301289249
2. Khawaja Talha Haseeb
 Student ID: 301274473
3. Muhammad Bilal Dilbar Hussain
 Student ID: 301205152
App description: This is first part of App. In this part, using SiwftUI we have added functional logic for the Slot Machine App.
Last Updated 05 Febraury, 2023
Xcode Version : Version 14.2 (14C18)
 */

import SwiftUI

struct ContentView: View
{
    @State private var money = 1000
    @State private var betAmount = 0
    @State private var wonMoney = 0
    @State private var blurRadius = 2
    @State private var winMessage = "Choose a bet"
    private var images = ["spin", "strawberry", "fruit", "jackpot"]
    @State private var numbers = [0, 0, 0]
    
    
    var body: some View
    {
        // for background design
        ZStack
        {
            Rectangle().foregroundColor(Color(red: 0, green: 0.9, blue: 0.8)).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color(red: 0.5, green: 1, blue: 0.8)).rotationEffect(Angle(degrees: 135)).edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color(red: 0.5, green: 1, blue: 0.8)).rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(.all)
            
            VStack
            {
                
                Image("slot-machine").resizable().frame(width: 380, height: 130).cornerRadius(40)
                
                Text("Win Jackpot").foregroundColor(.black).fontWeight(.heavy).scaleEffect(2)
                
                Spacer()
                
                HStack
                {
                    
                    Text("Your Bet: " + String(betAmount)).fontWeight(.medium).padding(.all, 10).background(Color.white.opacity(0.6)).cornerRadius(15)
                    
                    Text("Your Money: " + String(money)).fontWeight(.medium).padding(.all, 10).background(Color.white.opacity(0.6)).cornerRadius(15)
                }
                
                Spacer()
                
                HStack
                {
                    Spacer()
                    
                    Image(images[numbers[0]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Image(images[numbers[1]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Image(images[numbers[2]]).resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Spacer()
        
                }
                
                Text(winMessage).fontWeight(.medium).padding(.all, 10).background(Color.white.opacity(0.6)).cornerRadius(15).padding(.all, 35)
                
                
                HStack
                {
                    Button {
                        self.betAmount = 10
                        self.blurRadius = 0
                        self.winMessage = "Spin Now"
                    } label: {
                        Text("10").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 40).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                    Button {
                        self.betAmount = 50
                        self.blurRadius = 0
                        self.winMessage = "Spin Now"
                    } label: {
                        Text("50").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 40).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                    Button {
                        self.betAmount = 100
                        self.blurRadius = 0
                        self.winMessage = "Spin Now"
                    } label: {
                        Text("100").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 40).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                }
                
                HStack
                {
                    Button {
                        self.numbers[0] = 0
                        self.numbers[1] = 0
                        self.numbers[2] = 0
                        self.betAmount = 0
                        self.money = 1000
                        self.wonMoney = 0
                        self.blurRadius = 2
                        self.winMessage = "Choose a bet"
                        
                    } label: {
                        Text("Reset").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 65).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                    Button {
                        exit(0)
                    } label: {
                        Text("Quit").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 65).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }

                }
                
                Button {
                    self.numbers[0] = Int.random(in: 1...images.count - 1)
                    self.numbers[1] = Int.random(in: 1...images.count - 1)
                    self.numbers[2] = Int.random(in: 1...images.count - 1)
                    
                    // check winnings
                    if(self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2])
                    {
                        self.money += self.betAmount * 2
                        self.wonMoney = self.betAmount * 2
                        self.winMessage = "You Won: $" + String(wonMoney)
                    }
                    
//                    else if (self.numbers[0] == self.numbers[1] || self.numbers[1] == self.numbers[2])
//                    {
//                        self.money += self.betAmount
//                        self.wonMoney = self.betAmount
//                        self.winMessage = "You Won: $" + String(wonMoney)
//                    }
                    
                    else
                    {
                        self.money -= self.betAmount
                        self.wonMoney = 0
                        self.winMessage = "You Lost!!"
                        
                    }
                    
                    if(betAmount == 0 || money < betAmount)
                    {
                        self.blurRadius = 2
                    }
                    else
                    {
                        self.blurRadius = 0
                    }
                    
                } label: {
                    Text("Spin").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 163).background(Color.black.opacity(0.9)).cornerRadius(15)
                }.blur(radius: CGFloat(blurRadius), opaque: false).disabled(betAmount == 0 || money < betAmount)

            }
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
