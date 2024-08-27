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
        RetrogradePeriod(startDate: dateFormatter.date(from: "2027-02-09")!, endDate: dateFormatter.date(from: "2027-03-03")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2027-06-10")!, endDate: dateFormatter.date(from: "2027-07-04")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2027-10-07")!, endDate: dateFormatter.date(from: "2027-10-28")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2028-01-24")!, endDate: dateFormatter.date(from: "2028-02-14")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2028-05-21")!, endDate: dateFormatter.date(from: "2028-06-13")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2028-09-19")!, endDate: dateFormatter.date(from: "2028-10-11")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2029-01-07")!, endDate: dateFormatter.date(from: "2029-01-27")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2029-05-01")!, endDate: dateFormatter.date(from: "2029-05-25")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2029-09-02")!, endDate: dateFormatter.date(from: "2029-09-24")!),
        RetrogradePeriod(startDate: dateFormatter.date(from: "2029-12-21")!, endDate: dateFormatter.date(from: "2030-01-10")!),
        

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
