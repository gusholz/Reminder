//
//  CircleOutline.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 02/04/25.
//

import SwiftUI

struct CircleOutline: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(ColorManager.setColor(.branco), lineWidth: 2)
                .fill(.clear)
                .frame(width: 65, height: 65)
        }
    }
}
