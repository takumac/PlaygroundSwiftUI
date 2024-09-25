//
//  Task+Extension.swift
//  PlaygroundSwiftUI
//
//  Created by sakai on 2024/09/25.
//

import SwiftUI

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds duration: TimeInterval) async throws {
        let delay = UInt64(duration * 1000 * 1000 * 1000)
        try await Task.sleep(nanoseconds: delay)
    }
    
    static func sleep(millisecond duration: TimeInterval) async throws {
        let delay = UInt64(duration * 1000 * 1000)
        try await Task.sleep(nanoseconds: delay)
    }
    
    static func sleep(microseconds duration: TimeInterval) async throws {
        let delay = UInt64(duration * 1000)
        try await Task.sleep(nanoseconds: delay)
    }
}
