//
//  HabitsViewController.swift
//  MyHabits
//
//  Created by Владлен on 01.02.2022.
//

import UIKit

class HabitsViewController: UIViewController {
    
    private lazy var habitCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = UIColor(named: "Background")
        
        collection.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
        collection.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
        
        collection.dataSource = self
        collection.delegate = self
        
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Сегодня"

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewHabit))
        navigationItem.rightBarButtonItem?.tintColor = .purple
        
        habitCollectionView.register(ProgressCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: ProgressCollectionViewCell.self))
        habitCollectionView.register(HabitCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HabitCollectionViewCell.self))
        
        habitCollectionView.delegate = self
        habitCollectionView.dataSource = self
        
        habitCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(habitCollectionView)
        
        NSLayoutConstraint.activate([
            habitCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            habitCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            habitCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    

    @objc func addNewHabit() {
        print(#function)
       let habitVC = HabitViewController(habit: nil)
        let habitNVC = UINavigationController(rootViewController: habitVC)
        habitVC.modalPresentationStyle = .fullScreen
        habitVC.modalTransitionStyle = .coverVertical
        self.present(habitNVC, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.prefersLargeTitles = true
        habitCollectionView.reloadData()
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewHabit))
        self.navigationItem.rightBarButtonItem = barButton
    }
}
    
extension HabitsViewController: UICollectionViewDelegateFlowLayout {
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat
        width = collectionView.frame.width - 16 * 2
        switch indexPath.section {
        case 0:
            return CGSize(width: width, height: 60)
        case 1:
            return CGSize(width: width, height: 130)
        default:
            return CGSize(width: width, height: 130)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 22, left: 16, bottom: 18, right: 16)
        } else if section == 1 {
            return UIEdgeInsets(top: 18, left: 16, bottom: 12, right: 16)
        } else {
            return UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            default:
                let habitDatesVC = HabitDetailsViewController(habit: HabitsStore.shared.habits[indexPath.item])
                habitDatesVC.title = HabitsStore.shared.habits[indexPath.item].name
                navigationController?.pushViewController(habitDatesVC, animated: true)
            }
        default:
            break
        }
    }
}

extension HabitsViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return HabitsStore.shared.habits.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProgressCollectionViewCell.self), for: indexPath) as! ProgressCollectionViewCell
            return cell
         default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HabitCollectionViewCell.self), for: indexPath) as! HabitCollectionViewCell
            cell.habit = HabitsStore.shared.habits[indexPath.item]
            cell.habitInCollection = {self.habitCollectionView.reloadSections(IndexSet(integer: 0))}
            return cell
        }
    }

}
    

