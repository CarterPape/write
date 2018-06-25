//
//  WViewController.swift
//  write
//
//  Created by Carter Pape on 6/22/18.
//  Copyright © 2018 Carter Pape. All rights reserved.
//

import Cocoa


class WViewController: NSViewController {
    @IBOutlet weak var wordCountLabel : NSTextField!
    @IBOutlet weak var textEditor : WTextView!
    
    var textEditorDelegate : WTextEditorDelegate = WTextEditorDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        wordCountLabel.stringValue = "0"
        textEditorDelegate.wordCountLabel = wordCountLabel
        textEditorDelegate.textEditor = textEditor
    }
}
