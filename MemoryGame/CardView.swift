import SwiftUI

struct CardView: View {
    @State var isFlipped: Bool = false
    let icon : String
    
    var body: some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: 12)
                    .fill(.white)
                    .strokeBorder(lineWidth: 2)
                Text(icon)
                    .font(.largeTitle)
            }
            .opacity(isFlipped ? 1 : 0)
            RoundedRectangle(cornerRadius: 12)
                .fill()
                .opacity(isFlipped ? 0 : 1)
        }
        .onTapGesture {
            isFlipped.toggle()
        }
    }
}
