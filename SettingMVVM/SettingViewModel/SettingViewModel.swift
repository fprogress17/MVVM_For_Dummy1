//
//  SettingViewModel.swift
//  settingMVVM
//
//  Created by fprogress17 on 1/24/19.
//  Copyright © 2019 CLee All rights reserved.
//

import Foundation
import UIKit


class SettingViewModel {
     
    var setting : Setting
    var title : String
    
    init(setting: Setting, title : String){
        self.setting = setting
        self.title = title
    }
    
}
