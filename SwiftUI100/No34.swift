//
//  No34.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/28.
//

import SwiftUI

struct No34: View {
    @State private var message: String = "shake!"
    var body: some View {
        Text(message)
            .onReceive(NotificationCenter.default.publisher(for: .deviceDidShakeNotification)) { _ in
                message = "Device Did Shake"
            }
    }
}

extension NSNotification.Name {
    public static let deviceDidShakeNotification = NSNotification.Name("DeviceDidShakeNotification")
}

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        NotificationCenter.default.post(name: .deviceDidShakeNotification, object: event)
    }
}

struct No34_Previews: PreviewProvider {
    static var previews: some View {
        No34()
    }
}
