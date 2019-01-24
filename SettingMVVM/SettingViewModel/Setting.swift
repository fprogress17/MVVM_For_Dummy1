//
//  Setting.swift
//  settingMVVM
//
//  Created by fprogress17 on 1/24/19.
//  Copyright © 2019 CLee All rights reserved.
//

import Foundation

protocol CellDelegate : AnyObject {
  func toggledSwitch( _ : Any, section : SettingSectionNumber, index : Int?)
}

enum SettingSectionNumber : Int{
    case First
    case Second
    case Third
    case End
   
    
    static var count : Int  { get{ return SettingSectionNumber.End.rawValue   }}
    
    static func sectionTitles (section : SettingSectionNumber)->String{
        
        switch section {
        case .First:
            return  "First Title"
        case .Second:
            return  "Second Title";
        default:
            return "Third Title"
        }
        
    }
}


class Config {
    
    var enabled : Bool;
    var name : String
    var section : SettingSectionNumber
    var closure : ((Bool)->Void)?
 
    init(section: SettingSectionNumber, name : String, enable : Bool = true, closure : ((Bool)->Void)?  = nil){
        self.section = section
        self.name = name
        self.enabled = enable;
    }
}


class Setting : CellDelegate {
    

    var id = "Setting"
    var configs : [Config] = []
    
   
 
    init(configs : [Config]) {
     
        self.configs = configs
        
    }
    
    func addConfig(config : Config){
        self.configs.append(config)
    }
    
    func numberOfSection(section:SettingSectionNumber)->Int{
       
        return  configs.filter({ (config)->Bool in
            
            return config.section == section
            
        }).count
         
    }
    
    func textInSection(section:SettingSectionNumber, index : Int)->String{
        

        let res = configs.filter( { (config)->Bool in
                        return config.section == section }) 
        
        return res[index].name
        
    }
    
    func isOnToggleSwitch(section:SettingSectionNumber, index : Int)->Bool{
        
        let res = configs.filter( { (config)->Bool in
            return config.section == section })
        
        return res[index].enabled
        
    }
  
    
    // MARK: - Cell Delegate
    func toggledSwitch( _ : Any, section : SettingSectionNumber, index : Int?) {
    
        guard let index = index else { return }
        
        let res = configs.filter( { (config)->Bool in
                return config.section == section })
       
        let target : Config = res[index]
        target.enabled = !target.enabled
        
        target.closure?(target.enabled)
    }
}
