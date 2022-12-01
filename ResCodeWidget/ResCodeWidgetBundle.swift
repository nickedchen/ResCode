//
//  ResCodeWidgetBundle.swift
//  ResCodeWidget
//
//  Created by Nick Chen on 2022-11-23.
//

import WidgetKit
import SwiftUI

@main
struct ResCodeWidgetBundle: WidgetBundle {
    var body: some Widget {
        ResCodeWidget()
        ResCodeWidgetLiveActivity()
    }
}
