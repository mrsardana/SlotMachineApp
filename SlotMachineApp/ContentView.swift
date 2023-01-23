/*
 Assignment 1 – Slot Machine App - Part 1 : App UI
Group No 03
Author's name and StudentID:
1. Deepak Sardana
 Student ID: 301289249
2. Khawaja Talha Haseeb
 Student ID: 301274473
3. Muhammad Bilal Dilbar Hussain
 Student ID: 301205152
App description: This is first part of App. In this part, using SiwftUI we have created the User Interface (UI) for the Slot Machine App.
Last Updated 22 January, 2023
Xcode Version : Version 14.2 (14C18)
 */

import SwiftUI

struct ContentView: View
{
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
                    
                    Text("Your Bet: 0").fontWeight(.medium).padding(.all, 10).background(Color.white.opacity(0.6)).cornerRadius(15)
                    
                    Text("Your Money: 1000").fontWeight(.medium).padding(.all, 10).background(Color.white.opacity(0.6)).cornerRadius(15)
                }
                
                Spacer()
                
                HStack
                {
                    Spacer()
                    
                    Image("jackpot").resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Image("fruit").resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Image("strawberry").resizable().aspectRatio(1, contentMode: .fit).background(Color.white.opacity(0.5)).cornerRadius(20)
                    
                    Spacer()
        
                }
                
                Text("Your Won: $100").fontWeight(.medium).padding(.all, 10).background(Color.white.opacity(0.6)).cornerRadius(15).padding(.all, 35)
                
                
                HStack
                {
                    Button {
                        // Todo
                    } label: {
                        Text("10").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 40).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                    Button {
                        // Todo
                    } label: {
                        Text("50").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 40).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                    Button {
                        // Todo
                    } label: {
                        Text("100").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 40).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                }
                
                HStack
                {
                    Button {
                        // Todo
                    } label: {
                        Text("Reset").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 65).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }
                    Button {
                        // Todo
                    } label: {
                        Text("Quit").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 65).background(Color.black.opacity(0.85)).cornerRadius(15)
                    }

                }
                
                Button {
                    // Todo
                } label: {
                    Text("Spin").bold().foregroundColor(.white).padding(.all, 10).padding([.leading, .trailing], 163).background(Color.black.opacity(0.85)).cornerRadius(15)
                }

            }
            
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
