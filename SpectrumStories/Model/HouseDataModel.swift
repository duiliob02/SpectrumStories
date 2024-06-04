//
//  HouseDataModel.swift
//  SpectrumStories
//
//  Created by Luigi Cirillo on 04/06/24.
//

import Foundation
import SwiftUI

struct HousesData <NextView: View> {
    let name: String
    let data : HouseModel<NextView>
}
