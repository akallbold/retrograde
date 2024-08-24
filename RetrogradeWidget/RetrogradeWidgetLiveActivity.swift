//
//  RetrogradeWidgetLiveActivity.swift
//  RetrogradeWidget
//
//  Created by Anna Kallenborn-Bolden on 8/19/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct RetrogradeWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct RetrogradeWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: RetrogradeWidgetAttributes.self) { context in
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

extension RetrogradeWidgetAttributes {
    fileprivate static var preview: RetrogradeWidgetAttributes {
        RetrogradeWidgetAttributes(name: "World")
    }
}

extension RetrogradeWidgetAttributes.ContentState {
    fileprivate static var smiley: RetrogradeWidgetAttributes.ContentState {
        RetrogradeWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: RetrogradeWidgetAttributes.ContentState {
         RetrogradeWidgetAttributes.ContentState(emoji: "🤩")
     }
}
