//
//  RetrogradeData.swift
//  retrograde
//
//  Created by Anna Kallenborn-Bolden on 8/24/24.
//

import Foundation
import SwiftUI

struct RetrogradePeriod {
    let startDate: Date
    let endDate: Date
}

func getRetrogradeData() -> [RetrogradePeriod] {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return [
        RetrogradePeriod(startDate: dateFormatter.date(from: "2024-08-04")!, endDate: dateFormatter.date(from: "2024-08-28")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2024-11-25")!, endDate: dateFormatter.date(from: "2024-12-15")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2025-03-14")!, endDate: dateFormatter.date(from: "2025-04-07")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2025-07-17")!, endDate: dateFormatter.date(from: "2025-08-11")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2025-11-09")!, endDate: dateFormatter.date(from: "2025-11-29")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2026-02-25")!, endDate: dateFormatter.date(from: "2026-03-20")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2026-06-29")!, endDate: dateFormatter.date(from: "2026-07-23")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2026-10-24")!, endDate: dateFormatter.date(from: "2026-11-13")!),

    ]
}



func checkRetrogradeStatus(on date: Date = Date()) -> (isRetrograde: Bool, transitionDate: Date?) {
    let retrogradeData = getRetrogradeData()
    
    for period in retrogradeData {
        if date >= period.startDate && date <= period.endDate {
            return (true, period.endDate)
        } else if date < period.startDate {
            return (false, period.startDate)
        }
    }
    
    return (false, nil) // If no upcoming retrograde is found
}
