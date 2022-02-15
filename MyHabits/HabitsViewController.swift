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
        view.addSubview(habitCollectionView)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(toHabitVC))
        navigationItem.rightBarButtonItem?.tintColor = .systemPurple
        navigationController?.navigationBar.tintColor = .systemPurple
        navigationItem.title = "Сегодня"
        navigationController?.navigationBar.scrollEdgeAppearance = UINavigationBarAppearance()
    
        habitCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        NSLayoutConstraint.activate([
            habitCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            habitCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            habitCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            habitCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        habitCollectionView.reloadData()
    }
    
    @objc func toHabitVC() {
       let habitVC = HabitViewController(habit: nil)
        let habitNVC = UINavigationController(rootViewController: habitVC)
        habitVC.modalPresentationStyle = .fullScreen
        habitVC.modalTransitionStyle = .coverVertical
        self.present(habitNVC, animated: true, completion: nil)
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

extension HabitsViewController: UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch section {
        case 0:
            return UIEdgeInsets(top: 22, left: 16, bottom: 12, right: 16)
        case 1:
            return UIEdgeInsets(top: 6, left: 16, bottom: 6, right: 16)
        default:
            return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        }
    }
}
    

