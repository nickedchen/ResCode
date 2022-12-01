//
//  ResCodeWidget.swift
//  ResCodeWidget
//
//  Created by Nick Chen on 2022-11-23.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), title: "Open ResCode",configuration: ConfigurationIntent())
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), title: "Open ResCode", configuration: configuration)
        completion(entry)
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        let title: String = "Open ResCode"
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, title: title, configuration: configuration)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let title: String
    let configuration: ConfigurationIntent
}

struct ResCodeWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        ZStack{
            Color(.orange)
                .ignoresSafeArea()
            VStack{
                HStack{
                    Image("Resistor")
                        .resizable()
                        .frame(width: 80,height: 80)
                        .padding(.horizontal)
                    Spacer()
                }
                Button(entry.title) {}
                    .buttonStyle(.bordered)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.vertical)
        }
    }
    
}

struct ResCodeWidget: Widget {
    let kind: String = "ResCodeWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            ResCodeWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("ResCode Widget")
        .description("This is an example widget.")
    }
}

struct ResCodeWidget_Previews: PreviewProvider {
    static var previews: some View {
        ResCodeWidgetEntryView(entry: SimpleEntry(date: Date(), title: "Open Rescode", configuration: ConfigurationIntent()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
