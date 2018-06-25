//
//  WTextView.swift
//  write
//
//  Created by Carter Pape on 6/22/18.
//  Copyright © 2018 Carter Pape. All rights reserved.
//

import Foundation
import AppKit


class WTextView : NSTextView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        self.textColor = NSColor.white.blended(withFraction: 0.12,
                                               of: NSColor.clear)!
        
        self.textContainerInset = NSSize(width: 0,
                                         height: 40)
        
        self.font = NSFont(name: "Avenir Next",
                           size: 16)
        
        self.insertionPointColor = NSColor.systemBlue
        
        self.selectedTextAttributes = [
            NSAttributedStringKey.backgroundColor : NSColor.systemBlue.blended(withFraction: 0.5,
                                                                               of: NSColor.clear)!
        ]
        
        self.textContainer!.replaceLayoutManager(WTextViewLayoutManager())
    }
}


class WTextViewLayoutManager: NSLayoutManager {
    override func fillBackgroundRectArray(_ rectArray: UnsafePointer<NSRect>,
                                          count rectCount: Int,
                                          forCharacterRange charRange: NSRange,
                                          color: NSColor) {
        
        if (color == NSColor.secondarySelectedControlColor) {
            
            let highlightColor = NSColor.white.blended(withFraction: 0.6,
                                                       of: NSColor.clear)!
            highlightColor.setFill()
            super.fillBackgroundRectArray(rectArray,
                                          count: rectCount,
                                          forCharacterRange: charRange,
                                          color: highlightColor)
            
            super.fillBackgroundRectArray(rectArray, count: rectCount, forCharacterRange: charRange, color:
                NSColor.white.blended(withFraction: 0.6,
                                      of: NSColor.clear)!
            )
        }
        else {
            super.fillBackgroundRectArray(rectArray, count: rectCount, forCharacterRange: charRange, color: color)
        }
    }
}
