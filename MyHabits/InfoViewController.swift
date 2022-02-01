//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Владлен on 01.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    let scrollTextView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let infoControllerView: UIView = {
        let textView = UIView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let headerTextView: UILabel = {
        let headerText = UILabel()
        headerText.text = "Привычка за 21 день"
        headerText.font = .boldSystemFont(ofSize: 17)
        headerText.textColor = .black
        headerText.translatesAutoresizingMaskIntoConstraints = false
        return headerText
    }()
    
    let infoTextView: UILabel = {
        let infoText = UILabel()
        infoText.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:\n\n" + "1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.\n\n" + "2. Выдержать 2 дня в прежнем состоянии самоконтроля\n\n" + "3. Отметить в дневнике первую неделю изменений и подвести первые итоги - что оказалось тяжело, что - легче, с чем еще предстоит серьезно бороться.\n\n" + "4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет формк осознанного преодоления и человек осознанно сможет больше работать в сторону принятия положительных качеств.\n\n" + "5. Держать планку 40 дней. Практикующий методику уже чувствует освободившимся от прошлого негатива и двигается в нужном направлениии с хорошей динамикой.\n\n" + "6. На 90-й день соблюдения техники все лишнее из *Прошлой жизни* перестает напоминать о себе, и человек, оглянувшись назад, осознает себя полностью обновившимся.\n\n" + "Источник: psybook.ru"
        infoText.font = .systemFont(ofSize: 17)
        infoText.numberOfLines = 0
        infoText.textColor = .black
        infoText.translatesAutoresizingMaskIntoConstraints = false
        return infoText
    }()
    
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            title = "Информация"
            view.addSubview(scrollTextView)
            scrollTextView.addSubview(infoControllerView)
            infoControllerView.addSubview(headerTextView)
            infoControllerView.addSubview(infoTextView)
            setupConstraints()
        
        }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [scrollTextView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             scrollTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             
             infoControllerView.topAnchor.constraint(equalTo: scrollTextView.topAnchor),
             infoControllerView.bottomAnchor.constraint(equalTo: scrollTextView.bottomAnchor),
             infoControllerView.leadingAnchor.constraint(equalTo: scrollTextView.leadingAnchor),
             infoControllerView.trailingAnchor.constraint(equalTo: scrollTextView.trailingAnchor),
             infoControllerView.widthAnchor.constraint(equalTo: scrollTextView.widthAnchor),
             
             headerTextView.topAnchor.constraint(equalTo: infoControllerView.topAnchor, constant: 22),
             headerTextView.bottomAnchor.constraint(equalTo: infoTextView.topAnchor, constant: -16),
             headerTextView.leadingAnchor.constraint(equalTo: infoControllerView.leadingAnchor, constant: 16),
             headerTextView.trailingAnchor.constraint(equalTo: infoControllerView.trailingAnchor, constant: -16),
             
             infoTextView.leadingAnchor.constraint(equalTo: infoControllerView.leadingAnchor, constant: 16),
             infoTextView.trailingAnchor.constraint(equalTo: infoControllerView.trailingAnchor, constant: -16),
             infoTextView.bottomAnchor.constraint(equalTo: infoControllerView.bottomAnchor, constant: -16)])
        
    }
}
