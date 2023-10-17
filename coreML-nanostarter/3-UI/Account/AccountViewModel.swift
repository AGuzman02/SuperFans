//
//  AccountViewModel.swift
//  coreML-nanostarter
//
//  Created by Alumno on 13/10/23.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var name = "Mariano"
    @Published var age = 20
    @Published var weight = 90
    @Published var height = 1.90
    @Published var gender = true

}
