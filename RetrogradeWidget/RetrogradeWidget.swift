import WidgetKit
import SwiftUI

struct RetrogradeWidgetEntryView : View {
    var entry: RetrogradeProvider.Entry

    var body: some View {
        ZStack {
            if entry.isRetrograde {
                StaticPyramidView()
            } else {
                StaticCircleView()
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
        .description("Displays whether Mercury is in retrograde or not.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
struct RetrogradeWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RetrogradeWidgetEntryView(entry: RetrogradeEntry(date: Date(), isRetrograde: true))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            RetrogradeWidgetEntryView(entry: RetrogradeEntry(date: Date(), isRetrograde: true))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
//            RetrogradeWidgetEntryView(entry: RetrogradeEntry(date: Date(), isRetrograde: false))
//                .previewContext(WidgetPreviewContext(family: .systemMedium
//                                                    ))
        }
    }
}
