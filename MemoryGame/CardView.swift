
import SwiftUI

struct CardView: View {
    @State var isFlipped: Bool
    var icon: String
    
    var body: some View {
        Group {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(isFlipped ? .blue : .white)
                    .strokeBorder(.blue, lineWidth: 2)
                    
                Text(icon)
                    .font(.largeTitle)
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
