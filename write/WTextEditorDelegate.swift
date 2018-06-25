//
//  WTextEditorDelegate.swift
//  write
//
//  Created by Carter Pape on 6/24/18.
//  Copyright © 2018 Carter Pape. All rights reserved.
//

import Foundation
import AppKit


class WTextEditorDelegate : NSViewController, NSTextViewDelegate {
    var wordCounter : WWordCounter = WWordCounter()
    
    weak var wordCountLabel : NSTextField! {
        didSet {
            wordCounter.wordCountLabel = wordCountLabel
        }
    }
    
    weak var textEditor : WTextView! {
        didSet {
            textEditor.delegate = self
            wordCounter.textEditor = textEditor
        }
    }
    
    func textDidChange(_ notification: Notification) {
        wordCounter.handleTextChange()
    }
}
