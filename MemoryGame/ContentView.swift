import SwiftUI

struct ContentView: View {
    @State var theme = 1
    let off = 2
    @State var emojiArrayThemeBlue = ["😈", "😈","🌂", "☂️","🌂", "☂️"]
    @State var emojiArrayThemeRed = ["😢", "😢","😇", "😇", "🤯", "🤯","🤐", "🤐","🥹", "🥹","😂", "🤣","😂","🤣","🐱","🐱"]
    @State var emojiArrayThemeGreen = ["🥶", "🥶","🦋","🪼","🐳","🦕","🦋","🪼","🐳","🦕"]
    
    
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
        @State var emojiArray = themeContents()
        return HStack {
            ThemeButtonView(number: 1, image: "heart" , theme: $theme, emojiArray: $emojiArrayThemeRed)
            Spacer()
            ThemeButtonView(number: 2, image: "heart", theme: $theme,emojiArray: $emojiArrayThemeBlue)
            Spacer()
            ThemeButtonView(number: 3, image: "doc", theme: $theme,emojiArray: $emojiArrayThemeGreen)
        }
    }
    
    func themeContents() -> (Array<String>) {

        if theme == 1 {
            return emojiArrayThemeBlue.shuffled()
        }   else if theme == 2 {
            return emojiArrayThemeRed.shuffled()
        }   else {
            return emojiArrayThemeGreen.shuffled()
        }
    }

}

#Preview {
    ContentView()
}
