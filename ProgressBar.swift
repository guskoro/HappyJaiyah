//
//  File.swift
//  imHealth
//
//  Created by Guskoro Pradipta on 24/04/22.
//

import Foundation
import SwiftUI

struct ProgressBar: View {
    @Binding var value: Float
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                // Whole Bar
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(.teal)
                
                // Progress
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(.blue)
            }.cornerRadius(45.0)
        }
    }
}
