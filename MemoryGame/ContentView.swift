import SwiftUI

struct ContentView: View {
    @State var theme = 1
    let off = 2

    var body: some View {
        VStack {
            Text("Memo")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            ScrollView {
                cardDisplay
            }
            themeButtons
        }
        .foregroundColor(theme == 1 ? .blue : (theme == 2 ? .red : .green))
        .padding()
    }
    
    var cardDisplay: some View {
        let emojiArray = themeContents()
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach (0 ..< themeContents().count
                     , id: \.self) { index in
                CardView(isFlipped: true, icon: emojiArray[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
    }
    
    var themeButtons: some View {
        return themeButtonsViews()
    }
    
    func themeButtonsViews() -> some View {
        HStack {
            ThemeButtonView(number: 1, image: "heart" , theme: $theme)
            Spacer()
            ThemeButtonView(number: 2, image: "heart", theme: $theme)
            Spacer()
            ThemeButtonView(number: 3, image: "doc", theme: $theme)
        }
    }
    
    func themeContents() -> (Array<String>) {
        var emojiArray: [String] = []
        if theme == 1 {
            emojiArray = ["😈", "😈","🌂", "☂️","🌂", "☂️"]
        }   else if theme == 2 {
            emojiArray = ["😢", "😢","😇", "😇", "🤯", "🤯","🤐", "🤐","🥹", "🥹","😂", "🤣","😂", "🤣","🐱","🐱"]
        }   else {
            emojiArray = ["🥶", "🥶","🦋","🪼","🐳","🦕","🦋","🪼","🐳","🦕"]
        }
        emojiArray.shuffle()
        return emojiArray
    }
}

#Preview {
    ContentView()
}
