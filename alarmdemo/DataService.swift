import Foundation
import SwiftUI

struct DataService {
    let defaults = UserDefaults.standard
    
    private var alarms: [String] = []
    private var alarmsBool: [Bool] = []
    
    
    init() {
        alarms = defaults.object(forKey: "Alarms") as? [String] ?? []
        alarmsBool = defaults.object(forKey: "AlarmBools") as? [Bool] ?? []
    }
    
    func setNewAlarm(time: Date){
        let timeString = DateFormatter.localizedString(from: time, dateStyle: .none, timeStyle: .short)

        var tempAlarms = defaults.object(forKey: "Alarms") as? [String] ?? []
        var tempBools = defaults.object(forKey:"AlarmBools") as? [Bool] ?? []
        
        tempAlarms.append(timeString)
        tempBools.append(true)
        
        defaults.set(tempAlarms, forKey: "Alarms")
        defaults.set(tempBools, forKey: "AlarmBools")
    }
    
    func setOnOff(id: Int){
        var tempBools = defaults.object(forKey:"AlarmBools") as? [Bool] ?? []
        
        tempBools[id].toggle()
        defaults.set(tempBools, forKey: "AlarmBools")
    }
    
    func deleteAlarm(id: Int){
        var tempAlarms = defaults.object(forKey: "Alarms") as? [String] ?? []
        var tempBools = defaults.object(forKey:"AlarmBools") as? [Bool] ?? []
        
        tempAlarms.remove(at: id)
        tempBools.remove(at: id)
        
        defaults.set(tempAlarms, forKey: "Alarms")
        defaults.set(tempBools, forKey: "AlarmBools")
    }
    
    func getAlarms() -> [String] {
        return defaults.object(forKey: "Alarms") as? [String] ?? []
    }
    
    func getAlarmBools() -> [Bool] {
        return defaults.object(forKey: "AlarmBools") as? [Bool] ?? []
    }
    
}
