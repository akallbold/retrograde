import SwiftUI

struct ContentView: View {
    @State private var isRetrograde: Bool? = true
    @State private var transitionDate: Date? = nil

    var body: some View {
        ZStack {
            if let isRetrograde = isRetrograde, let transitionDate = transitionDate {
                if isRetrograde {
                    StarFieldView().edgesIgnoringSafeArea(.all)
                    GlowingText(text: "Mercury is in Retrograde until \(formattedDate(transitionDate))")
                    SpinningPyramidView()
                } else {
                    BreathingCircleView()  // Consolidated view used here
                    VStack {
                        Text("Mercury is not in Retrograde until \(formattedDate(transitionDate))")
                            .font(.custom("Optima", size: 26))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            } else {
                Color.gray.edgesIgnoringSafeArea(.all)
                Text("No retrograde data available")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
        .onAppear {
            checkStatus()
        }
    }

    func checkStatus() {
        let status = checkRetrogradeStatus()
//        self.isRetrograde = status.isRetrograde
        self.transitionDate = status.transitionDate
    }

    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

#Preview {
    ContentView()
}
