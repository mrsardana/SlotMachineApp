import SwiftUI

struct SupportView: View
{
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View
    {
        // for background design
        ZStack
        {
            Rectangle()
                .foregroundColor(Color(red: 0, green: 0.9, blue: 0.8))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 0.5, green: 1, blue: 0.8))
                .rotationEffect(Angle(degrees: 135))
                .edgesIgnoringSafeArea(.all)
            Rectangle()
                .foregroundColor(Color(red: 0.5, green: 1, blue: 0.8))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack
            {
                Image("slot-machine")
                    .resizable()
                    .frame(width: 380, height: 130)
                    .cornerRadius(40)
                Spacer()
                
                Form
                {
                    Section(header: Text("Instructions To Play").bold())
                    {
                        FormView(firstItem: "1:", secondItem: "Open the game. Place your bet by selecting the amount of coins you want to wager per spin.")
                        FormView(firstItem: "2:", secondItem: "Press the Spin button to start the slot machine.")
                        FormView(firstItem: "3:", secondItem: "Watch as the symbols spin and come to a stop.")
                        FormView(firstItem: "4:", secondItem: "If you land on a winning combination, your winnings will be added to your total money.")
                        FormView(firstItem: "5:", secondItem: "Continue playing and spinning the slot machine until you decide to cash out your winnings or run out of money.")
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color(red: 0.5, green: 1, blue: 0.8))
                .font(.system(.body, design: .rounded))
                
                Form
                {
                    Section(header: Text("About the Application").bold())
                    {
                        FormView(firstItem: "Application", secondItem: "Slot Machine Game")
                        FormView(firstItem: "Platforms", secondItem: "iPhone, iPad")
                        FormView(firstItem: "Developers", secondItem: "Deepak Sardana, Khawaja Talha, \nMuhammad Bilal")
                        FormView(firstItem: "Version", secondItem: "3.0.0")
                    }
                }
                .scrollContentBackground(.hidden)
                .frame(height: 235)
                .background(Color(red: 0.5, green: 1, blue: 0.8))
                .font(.system(.body, design: .rounded))
            }
            .padding(.top, 30)
        }
        .overlay(
            Button(action:
            {
                self.presentationMode.wrappedValue.dismiss()
            })
            {
                Spacer()
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .padding(.bottom, 780)
                    .padding(.trailing, 7)
            }
        .accentColor(Color.black))
    }
}

struct FormView: View
{
    var firstItem: String
    var secondItem: String
    
    var body: some View
    {
        HStack
        {
            List
            {
                Text(firstItem)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                   .frame(maxWidth: 87, alignment: .leading)
                Spacer()
                Text(secondItem)
                    .font(Font.system(size: 16))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct SupportView_Previews: PreviewProvider
{
    static var previews: some View
    {
        SupportView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
