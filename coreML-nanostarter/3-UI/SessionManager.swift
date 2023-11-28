//
//  SessionManager.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 26/11/23.
//

import Foundation

class SessionManager: ObservableObject {
    static let shared = SessionManager()

    @Published var authToken: String?

    private init() {}
}
