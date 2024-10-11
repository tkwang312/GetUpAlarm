import SwiftUI

struct ViewB: View {
    var data = DataService()
    @State private var alarmsArr: [String] = []
    @State private var alarmsBools: [Bool] = []

    init() {
        // Initialize arrays from DataService
        _alarmsArr = State(initialValue: data.getAlarms())
        _alarmsBools = State(initialValue: data.getAlarmBools())
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.white
                VStack (spacing: 8) {
                    HStack(){
                        Button(action: {
                            print("XD1")
                        }) {
                            Text("Edit")
                        }
                        Spacer()
                        NavigationLink(destination: ViewB2()) {
                            Image(systemName: "plus")
                        }
                    }
                    HStack{
                        Text("Alarm").foregroundColor(Color.black).font(.largeTitle)
                        Spacer()
                    }
                    
                    HStack{
                        Text("previous").foregroundColor(Color.black)
                        Spacer()
                    }
                    Divider()
                    
                    List {
                        ForEach(alarmsArr.indices, id: \.self) { index in
                            HStack {
                                Text(alarmsArr[index])
                                Spacer()
                                Image(systemName: alarmsBools[index] ? "checkmark.circle.fill" : "circle")
                            }
                        }
                    }
                    Spacer(minLength: 0)
                }
            }
            .padding()
        }
        }
}

struct ViewB2: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var selectedHour = 0
    @State var selectedMinute = 0
    @State var selectedAmPm = "AM"
    
    var hours = Array(1..<13)
    var minutes = Array(0..<60)
    var amPm = ["AM", "PM"]
    
    var body: some View {
        VStack{
            HStack{
                Picker("Hour", selection: $selectedHour) {
                    ForEach(hours, id: \.self) { hour in
                        Text("\(hour)").tag(hour)}
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: 100)
                
                Picker("Minute", selection: $selectedMinute) {
                    ForEach(minutes, id: \.self) { minute in
                        Text("\(minute)").tag(minute)}
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: 100)
                
                Picker("AmPm", selection: $selectedAmPm) {
                    ForEach(amPm, id: \.self) {amPm in
                        Text("\(amPm)").tag(amPm)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                .frame(maxWidth: 100)
            }
            
            Spacer(minLength: 0)
            
        }
        .navigationBarTitle("Set Alarm", displayMode: .inline)
        .navigationBarItems(
            trailing: Button("Done") {
                
                
                
                presentationMode.wrappedValue.dismiss()
            }
        )
        .padding()
        
    }
}

#Preview {
    ViewB()
}
