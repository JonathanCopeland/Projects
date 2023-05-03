//
//  FieldnotesWidget.swift
//  Fieldnotes
//
//  Created by Jonathan Copeland on 03/05/2023.
//

import SwiftUI
import WidgetKit

struct FieldnotesWidget: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FieldnotesWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FieldnotesWidget()
                .previewContext(WidgetPreviewContext(family:
                        .systemSmall))
        }
    }
}
