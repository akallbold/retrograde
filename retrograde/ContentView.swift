import SwiftUI

struct ContentView: View {
    @State  var isRetrograde: Bool? = true
    @State  var transitionDate: Date? = nil
    
    var body: some View {
        ZStack {
            if let isRetrograde = isRetrograde, let transitionDate = transitionDate {
                if isRetrograde {
                    SpinningPyramidView()
                    Text("Mercury is in Retrograde until \(formattedDate(transitionDate))")
                        .font(.custom("Optima", size: 26))
                        .foregroundColor(.white)
                        .padding()
                    
                    
                } else {
                    BreathingCircleView()
                    VStack {
                        Text("Mercury is not in Retrograde until \(formattedDate(transitionDate))")
                            .font(.custom("Optima", size: 26))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            } else {
                NoDataView()
                Text("No retrograde data available")
                    .foregroundColor(.white)
                    .font(.custom("Optima", size: 26))
                    .padding()
            }
        }
        .onAppear {
                        checkStatus()
        }
    }
    
    func checkStatus() {
        let status = checkRetrogradeStatus()
        self.isRetrograde = status.isRetrograde
        self.transitionDate = status.transitionDate
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM d"
        return formatter.string(from: date)
    }
}

//#Preview {
//    ContentView()
//}
