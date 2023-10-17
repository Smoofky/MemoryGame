
import SwiftUI

struct CardView: View {
    @State var isFlipped: Bool
    var icon: String
    
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isFlipped ? .blue : .white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(.blue, lineWidth: 2)
                Text(icon)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .opacity(isFlipped ? 0 : 1)
            }
        }
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}

#Preview {
    CardView(isFlipped: true, icon: "🫠")
}
