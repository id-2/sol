import Foundation

let appDelegate = NSApp.delegate as? AppDelegate

final class Panel: NSPanel, NSWindowDelegate {
  init(contentRect: NSRect) {
    super.init(
      contentRect: contentRect,
      styleMask: [.borderless, .fullSizeContentView, .nonactivatingPanel],
      backing: .buffered,
      defer: false
    )

    self.hasShadow = true
    self.level = .mainMenu + 3
    self.collectionBehavior.insert(.fullScreenAuxiliary)  // Allows the pannel to appear in a fullscreen space
    self.collectionBehavior.insert(.canJoinAllSpaces)
    self.titleVisibility = .hidden
    self.titlebarAppearsTransparent = true
    self.isMovableByWindowBackground = true
    self.isReleasedWhenClosed = false
    self.isOpaque = false
    self.delegate = self
    self.backgroundColor = NSColor.clear
  }

  override var canBecomeKey: Bool {
    return true
  }

  override var canBecomeMain: Bool {
    return true
  }

  func windowDidResignKey(_ notification: Notification) {
    DispatchQueue.main.async {
      appDelegate?.hideWindow()
    }
  }
}
