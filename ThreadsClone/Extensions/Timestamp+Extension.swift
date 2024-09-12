//
//  Timestamp+Extension.swift
//  ThreadsClone
//
//  Created by henry on 9/10/24.
//

import Foundation
import Firebase

extension Timestamp {
    
    func toAgoFormattedString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .hour, .day, .weekday, .month]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    }
    
}
