import SwiftUI

struct ThemeButtonView: View {
    @State var number: Int
    @State var image: String
    @Binding var theme: Int
    @Binding var emojiArray : [String]
    var body: some View {
        Button {
            theme = number
            emojiArray.shuffle()
        } label: {
            VStack {
                Image(systemName: image)
                Text("Motyw " + String(number))
            }
        }
    }
}
