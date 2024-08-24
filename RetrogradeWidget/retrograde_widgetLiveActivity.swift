//
//  retrograde_widgetLiveActivity.swift
//  retrograde_widget
//
//  Created by Anna Kallenborn-Bolden on 8/19/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct retrograde_widgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct retrograde_widgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: retrograde_widgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension retrograde_widgetAttributes {
    fileprivate static var preview: retrograde_widgetAttributes {
        retrograde_widgetAttributes(name: "World")
    }
}

extension retrograde_widgetAttributes.ContentState {
    fileprivate static var smiley: retrograde_widgetAttributes.ContentState {
        retrograde_widgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: retrograde_widgetAttributes.ContentState {
         retrograde_widgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: retrograde_widgetAttributes.preview) {
   retrograde_widgetLiveActivity()
} contentStates: {
    retrograde_widgetAttributes.ContentState.smiley
    retrograde_widgetAttributes.ContentState.starEyes
}
