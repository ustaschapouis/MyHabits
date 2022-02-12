//
//  ProgressCollectionViewCell.swift
//  MyHabits
//
//  Created by Владлен on 03.02.2022.
//

import UIKit

class ProgressCollectionViewCell: UICollectionViewCell {
    
    let progressTextLabel: UILabel = {
        let progressText = UILabel()
        progressText.text = "Все получится!!!"
        progressText.font = .systemFont(ofSize: 13)
        progressText.translatesAutoresizingMaskIntoConstraints = false
        return progressText
    }()
    
    let progressPercentLabel: UILabel = {
        let progressPercent = UILabel()
        progressPercent.text = "\(Int(HabitsStore.shared.todayProgress * 100))%"
        progressPercent.font = .systemFont(ofSize: 13)
        progressPercent.translatesAutoresizingMaskIntoConstraints = false
        return progressPercent
    }()
    
    let progressLineView: UIProgressView = {
        let progressLine = UIProgressView()
        progressLine.setProgress(HabitsStore.shared.todayProgress, animated: true)
        progressLine.progressTintColor = .purple
        progressLine.translatesAutoresizingMaskIntoConstraints = false
        return progressLine
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
        contentView.addSubview(progressLineView)
        contentView.addSubview(progressTextLabel)
        contentView.addSubview(progressPercentLabel)
        
        NSLayoutConstraint.activate([
            
            progressTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            progressTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressTextLabel.bottomAnchor.constraint(equalTo: progressLineView.topAnchor, constant: -10),
            
            progressPercentLabel.topAnchor.constraint(equalTo: progressTextLabel.topAnchor),
            progressPercentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressPercentLabel.widthAnchor.constraint(equalToConstant: 40),
            progressPercentLabel.heightAnchor.constraint(equalToConstant: 20),
            
            progressLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            progressLineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            progressLineView.heightAnchor.constraint(equalToConstant: 7)
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
