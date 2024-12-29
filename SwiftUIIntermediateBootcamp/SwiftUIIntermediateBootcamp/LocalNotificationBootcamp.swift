//
//  LocalNotificationBootcamp.swift
//  SwiftUIIntermediateBootcamp
//
//  Created by Philophobic on 29/12/24.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    
    static let shared = NotificationManager()
    private init() {}
    
    func requestForAuthorization() {
        let options : UNAuthorizationOptions = [.badge,.alert,.sound]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { sucees, error in
            if let error = error {
                print(error.localizedDescription)
            }else  {
                print("Sucess")
            }
            
        }
    }
    
    func scheduleNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "This is my first Notification"
        content.subtitle = "This is sooo easy"
        content.sound = .default
        content.badge = 2
        
        //time
       // let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        //calender
        var dateComponents = DateComponents()
        dateComponents.hour = 16
        dateComponents.minute = 21
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotificationBootcamp: View {
    var body: some View {
        VStack(spacing:40) {
            
            Button("Request Permisson") {
                NotificationManager.shared.requestForAuthorization()
            }
            
            Button("Schedule Notification") {
                NotificationManager.shared.scheduleNotification()            }
        }
    }
}

#Preview {
    LocalNotificationBootcamp()
}
