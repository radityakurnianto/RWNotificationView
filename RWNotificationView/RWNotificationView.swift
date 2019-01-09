//
//  RWNotificationView.swift
//  RWNotificationView
//
//  Created by Raditya Kurnianto on 1/9/19.
//  Copyright © 2019 Raditya Kurnianto. All rights reserved.
//

import UIKit

open class RWNotificationView: UIViewController {
    var notifTopConstraint, notifLeftConstraint, notifRightConstraint, notifHeightConstraint, notifBottomConstraint: NSLayoutConstraint!
    var titleTopConstraint, titleLeftConstraint, titleRightConstraint, titleHeightConstraint: NSLayoutConstraint!
    
    var notificationTitle, notificationSubtitle: String?
    var onClickNotification:(()->Void)?
    
    
    lazy var notificationView: UIView = { [unowned self] in
        let containerView = UIView()
        containerView.backgroundColor = .lightGray
        containerView.layer.cornerRadius = 8.0
        
        return containerView
        }()
    
    lazy var buttonAction: UIButton = { [unowned self] in
        let button = UIButton()
        button.addTarget(self, action: #selector(doSomething), for: .touchUpInside)
        return button
        }()
    
    lazy var titleLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
        }()
    
    lazy var subtitleLabel: UILabel = { [unowned self] in
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
        }()
    
    convenience init() {
        self.init(title: "", subtitle: nil)
    }
    
    init(title: String, subtitle: String?) {
        self.notificationTitle = title
        self.notificationSubtitle = subtitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setContent()
        createView()
    }
    
    @objc func doSomething() -> Void {
        onClickNotification?()
        self.dismiss(animated: false, completion: nil)
    }
    
    // MARK: - Setup View
    fileprivate func addNotificationConstraints() -> Void {
        notificationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notificationView)
        
        notifTopConstraint = notificationView.topAnchor.constraint(equalTo: view.topAnchor, constant: -100)
        notifLeftConstraint = notificationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        notifRightConstraint = notificationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10)
        
        NSLayoutConstraint.activate([notifTopConstraint, notifLeftConstraint, notifRightConstraint])
    }
    
    fileprivate func addTitleConstraints() -> Void {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        notificationView.addSubview(titleLabel)
        
        titleTopConstraint = titleLabel.topAnchor.constraint(equalTo: notificationView.topAnchor, constant: 15)
        titleLeftConstraint = titleLabel.leftAnchor.constraint(equalTo: notificationView.leftAnchor, constant: 15)
        titleRightConstraint = titleLabel.rightAnchor.constraint(equalTo: notificationView.rightAnchor, constant: -15)
        titleHeightConstraint = titleLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 21)
        
        NSLayoutConstraint.activate([titleTopConstraint, titleLeftConstraint, titleRightConstraint, titleHeightConstraint])
    }
    
    fileprivate func addSubtitleConstraint() -> Void {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonAction.translatesAutoresizingMaskIntoConstraints = false
        
        notificationView.addSubview(subtitleLabel)
        notificationView.addSubview(buttonAction)
        
        let top = subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15)
        let left = subtitleLabel.leftAnchor.constraint(equalTo: notificationView.leftAnchor, constant: 15)
        let right = subtitleLabel.rightAnchor.constraint(equalTo: notificationView.rightAnchor, constant: -15)
        notifBottomConstraint = subtitleLabel.bottomAnchor.constraint(equalTo: notificationView.bottomAnchor, constant: -15)
        
        NSLayoutConstraint.activate([top, left, right, notifBottomConstraint])
        NSLayoutConstraint.activate([
            buttonAction.topAnchor.constraint(equalTo: notificationView.topAnchor),
            buttonAction.leftAnchor.constraint(equalTo: notificationView.leftAnchor),
            buttonAction.rightAnchor.constraint(equalTo: notificationView.rightAnchor),
            buttonAction.bottomAnchor.constraint(equalTo: notificationView.bottomAnchor)
            ])
    }
    
    func setContent() -> Void {
        titleLabel.text = notificationTitle
        if let subtitle = notificationSubtitle {
            subtitleLabel.text = subtitle
        }
    }
    
    fileprivate func createView() {
        addNotificationConstraints()
        addTitleConstraints()
        addSubtitleConstraint()
        
        animated(show: true)
    }
    
    fileprivate func animated(show param: Bool) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            
            UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.9, options: .curveEaseInOut, animations: {
                self?.notificationView.transform = param ? CGAffineTransform(translationX: 0, y: 22 + (self?.notificationView.frame.height)!) : .identity
            }, completion: { (completed) in
                self?.animated(show: false)
                
                if !param {
                    self?.dismiss(animated: false, completion: nil)
                }
            })
        }
    }
}
