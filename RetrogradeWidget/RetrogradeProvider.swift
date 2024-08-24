import WidgetKit
import SwiftUI

struct RetrogradeProvider: TimelineProvider {
    func placeholder(in context: Context) -> RetrogradeEntry {
        RetrogradeEntry(date: Date(), isRetrograde: false)
    }

    func getSnapshot(in context: Context, completion: @escaping (RetrogradeEntry) -> Void) {
        let entry = RetrogradeEntry(date: Date(), isRetrograde: false)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<RetrogradeEntry>) -> Void) {
        fetchRetrogradeStatus { isRetrograde in
            let entryDate = Calendar.current.startOfDay(for: Date()).addingTimeInterval(86400) // Next midnight
            let entry = RetrogradeEntry(date: entryDate, isRetrograde: isRetrograde)
            let timeline = Timeline(entries: [entry], policy: .atEnd)
            completion(timeline)
        }
    }

    func fetchRetrogradeStatus(completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: "https://mercuryretrogradeapi.com") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }

            if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Bool],
               let isRetrograde = json["is_retrograde"] {
                completion(isRetrograde)
            }
        }

        task.resume()
    }
}

struct RetrogradeEntry: TimelineEntry {
    let date: Date
    let isRetrograde: Bool
}
