//
//  AccountModel.swift
//  coreML-nanostarter
//
//  Created by Alumno on 13/10/23.
//

import Foundation
import SwiftUI

struct Account : Identifiable, Decodable {
    var id = UUID()
    let name: String
    let age: Int
    let weight: Int
    let height: Int
    let gender: Bool
    let actFis: Double
}
