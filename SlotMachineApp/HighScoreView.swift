import SwiftUI

struct HighScoreView: View
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
            
            VStack(spacing:20)
            {
                Form
                {
                    Section(header: Text("High Scores").bold())
                    {
                        ForEach(ContentView.shared.vm.savedEntities)
                        {
                            entity in FormView1(firstItem: String(entity.date!), secondItem: String(entity.wonMoney))
                        }
 
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color(red: 0.5, green: 1, blue: 0.8))
                .font(.system(.body, design: .rounded))

            }
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

struct FormView1: View
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
                   .frame(maxWidth: 220, alignment: .leading)
                Spacer()
                Text(secondItem)
                    .font(Font.system(size: 16))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct HighScoreView_Previews: PreviewProvider
{
    static var previews: some View
    {
        HighScoreView()
            .previewDevice("iPhone 14 Pro Max")
    }
}

