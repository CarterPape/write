//
//  WWordCountDelegate.swift
//  write
//
//  Created by Carter Pape on 6/24/18.
//  Copyright © 2018 Carter Pape. All rights reserved.
//

import Foundation
import AppKit


class WWordCounter {
    weak var wordCountLabel : NSTextField!
    weak var textEditor : WTextView!
    
    func handleTextChange() {
        let wordCount = textEditor.string.wordCount
        wordCountLabel.stringValue = String(wordCount)
    }
}


extension String {
    var wordCount: Int {
        var count = 0
        let range = Range(startIndex..<endIndex)
        enumerateSubstrings(in: range, options: [.byWords, .substringNotRequired, .localized], { _, _, _, _ -> () in
            count += 1
        })
        return count
    }
}
