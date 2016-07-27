/*
* Copyright (c) 2015 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Cocoa

class ComponentsViewController: NSViewController {
    
    @IBOutlet var footerView: NSView!
    @IBOutlet var headerView: NSView!
    @IBOutlet var textLabel: NSTextField!
    @IBOutlet var subtextLabel: NSTextField!
    @IBOutlet var image: NSImageView!
    @IBOutlet var progressIndicator: NSProgressIndicator!
    @IBOutlet weak var progressText: NSTextField!
    @IBOutlet weak var menuButton: NSButton!

  let components = Component.all

  var currentComponentIndex: Int = 0 {
    didSet {
      updateQuote()
    }
  }

  func updateQuote() {
    textLabel.stringValue = "\(components[currentComponentIndex].text)"
    subtextLabel.stringValue = "by \(components[currentComponentIndex].author)"
    image.image = components[currentComponentIndex].image
    
  }
    
  override func viewDidLoad() {
    super.viewDidLoad()
        
  }

  override func viewWillAppear() {
    super.viewWillAppear()

    currentComponentIndex = 0
  }
}

// MARK: Actions

extension ComponentsViewController {
  @IBAction func goLeft(sender: NSButton) {
    currentComponentIndex = (currentComponentIndex - 1 + components.count) % components.count
  }

  @IBAction func goRight(sender: NSButton) {
    currentComponentIndex = (currentComponentIndex + 1) % components.count
  }

  @IBAction func quit(sender: NSButton) {
    NSApplication.sharedApplication().terminate(sender)
  }
    
    func renderStatus() {
        self.progressText.bezeled = false
        self.progressText.editable = false
        self.progressText.drawsBackground = false
    }

    @IBAction func menuButtonWasClicked(sender: AnyObject) {
    }
    
    
}
