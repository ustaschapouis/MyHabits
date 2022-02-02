//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Владлен on 01.02.2022.
//

import UIKit

class HabitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.backgroundColor = .white
        
        
        title = "Сегодня"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showNewHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple
       
    }
    

    @objc func showNewHabit() {
        print("Добавляется новая привычка")
    }

}
