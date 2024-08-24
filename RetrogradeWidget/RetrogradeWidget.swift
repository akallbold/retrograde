import WidgetKit
import SwiftUI

struct RetrogradeWidgetEntryView : View {
    var entry: RetrogradeProvider.Entry

    var body: some View {
        ZStack {
            // Set the overall background to match the widget's content
            if entry.isRetrograde {
                // Warm color scheme for retrograde
                LinearGradient(
                    gradient: Gradient(colors: [Color.pink.opacity(0.3), Color.orange.opacity(0.3), Color.red.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all) // Ensures the gradient covers the entire widget background, including padding
            } else {
                // Calm color scheme for non-retrograde
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .edgesIgnoringSafeArea(.all) // Ensures the gradient covers the entire widget background, including padding
            }
            
            // Overlay the actual content (circle) on top of the matching background
            if entry.isRetrograde {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.orange]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
            } else {
                Circle()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.8)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100)
            }
        }
        .containerBackground(.clear, for: .widget)
    }
}

struct RetrogradeWidget: Widget {
    let kind: String = "RetrogradeWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: RetrogradeProvider()) { entry in
            RetrogradeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Mercury Retrograde Widget")
        .description("Displays whether Mercury is in retrograde.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
struct RetrogradeWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RetrogradeWidgetEntryView(entry: RetrogradeEntry(date: Date(), isRetrograde: true))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            RetrogradeWidgetEntryView(entry: RetrogradeEntry(date: Date(), isRetrograde: false))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
