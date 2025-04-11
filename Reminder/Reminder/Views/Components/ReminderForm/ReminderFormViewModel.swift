//
//  ReminderFormViewModel.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 07/04/25.
//

import Foundation

@Observable
class ReminderFormViewModel {
    var selectedDate: Date = Date.now
    var selectedTime: Date = Date.now
    var selectedDays = [false, false, false, false, false, false, false]
    var selectedList: ReminderList?
    
}
