//
//  ViewController.swift
//  settingMVVM
//
//  Created by fprogress17 on 1/24/19.
//  Copyright © 2019 CLee All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    var settingViewModel : SettingViewModel?{
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var settingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
         
    }

    
    private func setupView() {
       
        setupTableView()
        updateView()
    
    }
    
    private func setupTableView(){
        
        self.settingTableView.dataSource = self;
        self.settingTableView.allowsSelection = false;
        
    }

    
    func updateView(){
        if( !isViewLoaded ) {
            return;
        }
        
        self.navigationItem.title = settingViewModel?.title
        
        self.settingTableView.reloadData()
    }
    
}

// MARK: - TableView DataSource

extension SettingViewController :  UITableViewDataSource
{
    
    func  numberOfSections(in tableView: UITableView) -> Int {
        return SettingSectionNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = SettingSectionNumber(rawValue: indexPath.section) else { return UITableViewCell() }
        
        switch section {
        case .First:
            return cellForFirstSectionForRowAtIndexPath(tableView:tableView, indexPath: indexPath  )
        case .Second:
            return cellForSecondSectionForRowAtIndexPath(tableView:tableView, indexPath: indexPath  )
        case .Third:
            return cellForThirdSectionForRowAtIndexPath(tableView:tableView, indexPath: indexPath  )
        default:
            return UITableViewCell()
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingSectionNumber(rawValue: section) else { return 0 }
        guard let settingViewModel = settingViewModel else { return 0 }
        return settingViewModel.setting.numberOfSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let section = SettingSectionNumber(rawValue: section) else { return "" }
        guard settingViewModel != nil else { return "" }
        return SettingSectionNumber.sectionTitles(section: section)
    }
    
    private func cellForFirstSectionForRowAtIndexPath(tableView:UITableView,indexPath:  IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FirstSectionTableViewCell.reuseIdentifier, for: indexPath as IndexPath) as? FirstSectionTableViewCell, let settingViewModel = settingViewModel else {
            return UITableViewCell()
        }
        
        if( cell.cellDelegate == nil ){
            cell.cellDelegate = settingViewModel.setting
        }
      
        cell.contentView.tag = indexPath.row
        cell.textLabel?.text = settingViewModel.setting.textInSection(section: .First, index: indexPath.row)
       
        if(cell.toggleSwitch.isOn != settingViewModel.setting.isOnToggleSwitch(section: .First, index: indexPath.row)){
            cell.toggleSwitch.isOn = settingViewModel.setting.isOnToggleSwitch(section: .First, index: indexPath.row)
        }
        return cell
    }
    
    private func cellForSecondSectionForRowAtIndexPath(tableView:UITableView,indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SecondSectionTableViewCell.reuseIdentifier, for: indexPath) as? SecondSectionTableViewCell, let settingViewModel = settingViewModel  else {
            return UITableViewCell()
        }
        
        if( cell.cellDelegate == nil ){
            cell.cellDelegate = settingViewModel.setting
        }
        
        cell.contentView.tag = indexPath.row
        cell.textLabel?.text = settingViewModel.setting.textInSection(section: .Second, index: indexPath.row)
        
        if( cell.toggleSwitch.isOn != settingViewModel.setting.isOnToggleSwitch(section: .Second, index: indexPath.row)){
            cell.toggleSwitch.isOn = settingViewModel.setting.isOnToggleSwitch(section: .Second, index: indexPath.row)
        }
        
        return cell
    }
    
    private func cellForThirdSectionForRowAtIndexPath(tableView:UITableView,indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ThirdSectionTableViewCell.reuseIdentifier, for: indexPath) as? ThirdSectionTableViewCell, let settingViewModel = settingViewModel  else {
            return UITableViewCell()
        }
        
        if( cell.cellDelegate == nil ){
            cell.cellDelegate = settingViewModel.setting
        }
        
         cell.contentView.tag = indexPath.row
         cell.textLabel?.text = settingViewModel.setting.textInSection(section: .Third, index: indexPath.row)

        if( cell.toggleSwitch.isOn != settingViewModel.setting.isOnToggleSwitch(section: .Third, index: indexPath.row)){
            cell.toggleSwitch.isOn = settingViewModel.setting.isOnToggleSwitch(section: .Third, index: indexPath.row)
        }
        return cell
    }
    
}
