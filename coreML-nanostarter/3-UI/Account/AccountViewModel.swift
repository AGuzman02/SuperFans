//
//  AccountViewModel.swift
//  coreML-nanostarter
//
//  Created by Alumno on 13/10/23.
//

import Foundation
import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var name = "-----"
    @Published var age = -1
    @Published var weight = -1
    @Published var height = -1
    @Published var gender = true
    @Published var actFis = 1.7

}
