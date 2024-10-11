import SwiftUI


struct ContentView: View {
    @StateObject var timeExample = TimeExample()
    
    var body: some View {
        ZStack {
            TabView {
                ViewA().tabItem {
                    Image(systemName: "timer")
                    Text("Clock")
                }
                ViewB().tabItem {
                    Image(systemName: "alarm")
                    Text("Alarm")
                }
                ViewC().tabItem {
                    Image(systemName: "stopwatch")
                    Text("Stopwatch")
                }
                ViewD().tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
