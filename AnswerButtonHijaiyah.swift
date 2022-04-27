//
//  File.swift
//  imHealth
//
//  Created by Guskoro Pradipta on 23/04/22.
//

import Foundation
import SwiftUI

struct AnswerButtonHijaiyah: View {
    var letter : String
    // Showing Hijaiyah Letter on The Button
    var body: some View {
        Text("\(letter)")
            .frame(width: 110, height: 110)
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Circle())
            .padding()
    }
}

