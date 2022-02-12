//
//  HabitCollectionViewCell.swift
//  MyHabits
//
//  Created by Владлен on 03.02.2022.
//

import UIKit

class HabitCollectionViewCell: UICollectionViewCell {
    var habitInCollection = {}
    var habit: Habit? {
        didSet{
            habitName.text = habit?.name
            habitTime.text = habit?.dateString
            habitButton.layer.borderColor = habit?.color.cgColor
            habitName.textColor = habit?.color
            habitDay.text = ("Подряд: \(habit!.trackDates.count)")
        }
    }
    
    var habitName: UILabel = {
        var habitName = UILabel()
        habitName.translatesAutoresizingMaskIntoConstraints = false
        habitName.font = .systemFont(ofSize: 15)
        habitName.numberOfLines = 2
        return habitName
    }()
    
    var habitDay: UILabel = {
        var habitDay = UILabel()
        habitDay.textColor = .systemGray
        habitDay.translatesAutoresizingMaskIntoConstraints = false
        return habitDay
    }()
    
    var habitTime: UILabel = {
        var habitTime = UILabel()
        habitTime.textColor = .systemGray
        habitTime.translatesAutoresizingMaskIntoConstraints = false
        return habitTime
    }()
    
    var habitButton: UIButton = {
        var habitButton = UIButton(type: .system)
        habitButton.translatesAutoresizingMaskIntoConstraints = false
        habitButton.backgroundColor = .white
        habitButton.layer.cornerRadius = 18
        habitButton.layer.borderWidth = 1
        habitButton.layer.masksToBounds = true
        habitButton.addTarget(self, action: #selector(trackHabit), for: .touchUpInside)
        return habitButton
    }()
    
    
    @objc func trackHabit() {
        switch habit!.isAlreadyTakenToday {
        case false:
            self.habitButton.backgroundColor = habit?.color
            HabitsStore.shared.track(habit!)
            habitDay.text = "Счётчик: \(String(describing: habit!.trackDates.count))"
            habitInCollection()
        case true:
            print("Привычка выполнена")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(habitDay)
        contentView.addSubview(habitTime)
        contentView.addSubview(habitName)
        contentView.addSubview(habitButton)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        NSLayoutConstraint.activate([
            habitName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            habitName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
            habitName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            
            habitTime.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitTime.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 3/4),
            habitTime.heightAnchor.constraint(equalToConstant: 20),
            
            habitDay.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            habitDay.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            habitDay.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5),
            habitDay.heightAnchor.constraint(equalToConstant: 20),
            
            habitButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 47),
            habitButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -47),
            habitButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -26),
            habitButton.widthAnchor.constraint(equalToConstant: 36)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
