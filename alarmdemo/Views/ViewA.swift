import SwiftUI

class TimeExample: ObservableObject {
    @Published var timeString: String = ""
    
    private var timer: Timer?
    
    init() {
        updateTime()
        startTimer()
    }
    
    func updateTime() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        if (hour >= 12) {
            if minutes < 10 {
                timeString = "\(hour - 12):0\(minutes)PM"
            } else {
                timeString = "\(hour - 12):\(minutes)PM"
            }
        } else {
            if minutes < 10 {
                timeString = "\(hour):0\(minutes)AM"
                
            } else {
                timeString = "\(hour):\(minutes)AM"
            }
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTime()
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}

struct ViewA: View {
    @StateObject var timeExample = TimeExample()

    var body: some View {
        ZStack{
            Color.white
            Text(timeExample.timeString)
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}

#Preview {
    ViewA()
}
