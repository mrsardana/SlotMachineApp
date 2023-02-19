/*
 Assignment 1 – Slot Machine App - Part 3 : App UI
Group No 03
Author's name and StudentID:
1. Deepak Sardana
 Student ID: 301289249
2. Khawaja Talha Haseeb
 Student ID: 301274473
3. Muhammad Bilal Dilbar Hussain
 Student ID: 301205152
App description: This is third part of App. In this part, using SiwftUI we have include additional Screens to our Slot Machine Appthat will display information about how to play your slot machine game and how much winning combinations will pay out. We used Core Data for Data persistence.
Last Updated 19 Febraury, 2023
Xcode Version : Version 14.2 (14C18)
 */

import SwiftUI

struct ButtonModifier: ViewModifier
{
    func body(content: Content) -> some View
    {
        content
            .font(.title)
            .accentColor(Color.black)
            .padding(.top, 135)
            .padding(.trailing, 25)
    }
}

struct ContentView: View
{
    @State private var money = 1000
    @State private var betAmount = 0
    @State private var wonMoney = 0
    @State private var blurRadius = 2
    @State private var winMessage = "Choose a bet"
    private var images = ["spin", "strawberry", "fruit", "jackpot"]
    @State private var numbers = [0, 0, 0]
    @State private var isSpinning = false
    @State private var animatingSymbol: Bool = false
    @State private var animatingModal: Bool = false
    @State private var showSupportView: Bool = false
    @State private var gameOverModal: Bool = false
    @State private var gameWinModal: Bool = false
    @State private var spinDegrees: Double = 0
    @State private var selectedIndex: Int = 0
    func spinReels()
    {
        self.numbers[0] = Int.random(in: 1...images.count - 1)
        self.numbers[1] = Int.random(in: 1...images.count - 1)
        self.numbers[2] = Int.random(in: 1...images.count - 1)
        soundPlaying(sound: "spin", type: "mp3")
    }
    
    func winningsCheck()
    {
        if(self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2])
        {
            self.money += self.betAmount * 2
            self.wonMoney += self.betAmount * 2
            self.winMessage = "Won Money: $" + String(wonMoney)
            soundPlaying(sound: "win", type: "mp3")
            gameWinModal = true
        }
        
        else
        {
            self.money -= self.betAmount
//            self.wonMoney = 0
            self.winMessage = "You Lost!!"
        }
    }
    
    func balanceCheck()
    {
        gameOver()
    }
    
    func betActivated()
    {
        soundPlaying(sound: "casino-chips", type: "mp3")
    }
    
    func betCheck()
    {
        if(betAmount == 0 || money < betAmount)
        {
            self.blurRadius = 2
        }
        else
        {
            self.blurRadius = 0
        }
    }
    
    func gameOver()
    {
        if money <= 0
        {
            gameOverModal = true
            self.wonMoney = 0
            soundPlaying(sound: "game-over", type: "mp3")
        }
    }
    
    func resetGame()
    {
        self.numbers[0] = 0
        self.numbers[1] = 0
        self.numbers[2] = 0
        self.betAmount = 0
        self.money = 1000
        self.wonMoney = 0
        self.blurRadius = 2
        self.winMessage = "Choose a bet"
        soundPlaying(sound: "chimeup", type: "mp3")
    }
    
    func quitGame()
    {
        exit(0)
    }
    
    var body: some View
    {
        // for background design
        ZStack
        {
            Rectangle().foregroundColor(Color(red: 0, green: 0.9, blue: 0.8))
                .edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color(red: 0.5, green: 1, blue: 0.8))
                .rotationEffect(Angle(degrees: 135))
                .edgesIgnoringSafeArea(.all)
            Rectangle().foregroundColor(Color(red: 0.5, green: 1, blue: 0.8))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack
            {
                Image("slot-machine")
                    .resizable()
                    .frame(width: 380, height: 130)
                    .cornerRadius(40)
                Text("Win Jackpot")
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                    .scaleEffect(2)
                Spacer()
                
                HStack
                {
                    
                    Text("Bet: " + String(betAmount))
                        .fontWeight(.medium).padding(.all, 10)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(15)
                    Text("Credits: " + String(money))
                        .fontWeight(.medium).padding(.all, 10)
                        .background(Color.white.opacity(0.6))
                        .cornerRadius(15)
                }
                
                Spacer()
                
                    HStack
                    {
                        ZStack
                        {
                            Image("slot-frame")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 135, height: 200)
                                .cornerRadius(15)
                            
                            Image(images[numbers[0]])
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 110)
                                .background(Color(hue: 35 / 360, saturation: 0.86, brightness: 0.8))
                                .cornerRadius(20)
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -200)
                                .animation(.easeOut(duration: Double.random(in: 0.1...0.9)))
                                .onAppear(perform: {self.animatingSymbol.toggle()})
                        }
                        
                        ZStack
                        {
                            Image("slot-frame")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 135, height: 200)
                                .cornerRadius(15)
                            
                            Image(images[numbers[1]])
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 110)
                                .background(Color(hue: 35 / 360, saturation: 0.86, brightness: 0.8))
                                .cornerRadius(20)
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -200)
                                .animation(.easeOut(duration: Double.random(in: 0.1...0.9)))
                                .onAppear(perform: {self.animatingSymbol.toggle()})
                        }
                        
                        ZStack
                        {
                            Image("slot-frame")
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 135, height: 200)
                                .cornerRadius(15)
                            
                            Image(images[numbers[2]])
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 110)
                                .background(Color(hue: 35 / 360, saturation: 0.86, brightness: 0.8))
                                .cornerRadius(20)
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -200)
                                .animation(.easeOut(duration: Double.random(in: 0.1...0.9)))
                                .onAppear(perform: {self.animatingSymbol.toggle()})
                        }
                    }
                
                Text(winMessage)
                    .fontWeight(.medium)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(15)
                    .padding(.all, 15)
                
                
                HStack
                {
                    Button
                    {
                        self.betAmount = 10
                        self.blurRadius = 0
                        self.betActivated()
                        self.winMessage = "Spin Now"
                    }
                    label:
                    {
                        Text("10")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 40)
                            .background(Color.black.opacity(0.85))
                            .cornerRadius(15)
                    }
                    Button
                    {
                        self.betAmount = 50
                        self.blurRadius = 0
                        self.betActivated()
                        self.winMessage = "Spin Now"
                    }
                    label:
                    {
                        Text("50")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 40)
                            .background(Color.black.opacity(0.85))
                            .cornerRadius(15)
                    }
                    Button
                    {
                        self.betAmount = 100
                        self.blurRadius = 0
                        self.betActivated()
                        self.winMessage = "Spin Now"
                    }
                    label:
                    {
                        Text("100")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 40)
                            .background(Color.black.opacity(0.85))
                            .cornerRadius(15)
                    }
                }
                
                HStack
                {
                    Button
                    {
                        resetGame()
                    }
                    label:
                    {
                        Text("Reset")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 65)
                            .background(Color.black.opacity(0.85))
                            .cornerRadius(15)
                    }
                    Button
                    {
                        quitGame()
                    }
                    label:
                    {
                        Text("Quit")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding([.leading, .trailing], 65)
                            .background(Color.black.opacity(0.85))
                            .cornerRadius(15)
                    }
                }
                
                Button
                {
                    spinDegrees += 720
                    withAnimation
                    {
                        self.animatingSymbol = false
                    }
                                            
                    // spin the reels with changing the symbols
                    self.spinReels()
                                            
                    // trigger the animation after changing the symbols
                    withAnimation
                    {
                        self.animatingSymbol = true
                    }
                    
                    self.isSpinning.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 15)
                    {
                        self.isSpinning = false
                    }
                    
                    // check winnings
                    self.winningsCheck()
                    
                    // money balance check
                    self.balanceCheck()
                    
                    // bet amount check
                    self.betCheck()
                    
                }
                label:
                {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all, 10)
                        .padding([.leading, .trailing], 163)
                        .background(Color.black.opacity(0.9))
                        .cornerRadius(15)
                }
                .blur(radius: CGFloat(blurRadius), opaque: false)
                .disabled(betAmount == 0 || money < betAmount)

            }
            .overlay(
                Button(action:
                {
                    self.showSupportView = true
                })
                {
                    Image(systemName: "info.circle")
                }
                    .modifier(ButtonModifier()), alignment: .topTrailing)
                .frame(maxWidth: 720)
                .blur(radius: $gameOverModal.wrappedValue ? 5 : 0, opaque: false)
            
            if $gameWinModal.wrappedValue
            {
                ZStack
                {
                    Color("ColorTransparentBlack")
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0)
                    {
                        Text("Great! You Win")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color(red: 0, green: 0.9, blue: 0.8))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16)
                        {
                            Text("Your total win is \(String(self.wonMoney))")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.gray)
                                .layoutPriority(1)
                            
                            Button(action:
                                {
                                self.gameWinModal = false
                                self.animatingModal = false
//                                resetGame()
                            })
                            {
                                Text("Spin Again".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(Color.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .cornerRadius(15)
                                    .background(
                                        Capsule()
                                        .strokeBorder(lineWidth: 1.75)
                                        .foregroundColor(Color(red: 0, green: 0.9, blue: 0.8)))
                            }
                            Button(action:
                                {
                                self.gameWinModal = false
                                self.animatingModal = false
//                                resetGame()
                            })
                            {
                                Text("Payout".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(Color.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .cornerRadius(15)
                                    .background(
                                        Capsule()
                                        .strokeBorder(lineWidth: 1.75)
                                        .foregroundColor(Color(red: 0, green: 0.9, blue: 0.8)))
                            }
                        }
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(Color.black)
                    .cornerRadius(15)
                    .shadow(color: Color(red: 0.5, green: 1, blue: 0.8), radius: 6, x: 0, y: 8)
                    .opacity($animatingModal.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModal.wrappedValue ? 0 : -100)
                    .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
                    .onAppear(perform:
                    {
                        self.animatingModal = true
                    })
                }
            }
            
            if $gameOverModal.wrappedValue
            {
                ZStack
                {
                    Color("ColorTransparentBlack")
                    .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0)
                    {
                        Text("Game Over")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color(red: 0, green: 0.9, blue: 0.8))
                            .foregroundColor(Color.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16)
                        {
                            Text("Bad luck! You lost all of the money. \nLet's play again!")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.gray)
                                .layoutPriority(1)
                            
                            Button(action:
                                {
                                self.gameOverModal = false
                                self.animatingModal = false
                                resetGame()
                            })
                            {
                                Text("Restart".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(Color.white)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .cornerRadius(15)
                                    .background(
                                        Capsule()
                                        .strokeBorder(lineWidth: 1.75)
                                        .foregroundColor(Color(red: 0, green: 0.9, blue: 0.8)))
                            }
                        }
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(Color.black)
                    .cornerRadius(15)
                    .shadow(color: Color(red: 0.5, green: 1, blue: 0.8), radius: 6, x: 0, y: 8)
                    .opacity($animatingModal.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModal.wrappedValue ? 0 : -100)
                    .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
                    .onAppear(perform:
                    {
                        self.animatingModal = true
                    })
                }
            }
        }
        .sheet(isPresented: $showSupportView)
        {
            SupportView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
