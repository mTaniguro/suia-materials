//
//  ImageExtension.swift
//  HITFit
//
//  Created by mami taniguro on 8/9/21.
//

import SwiftUI

extension Image {
    
    func resizedToFill(width: CGFloat, height: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
    }
   
}
