//
//  DismissViewController.swift
//  PushPopPresentDismissVisualized
//
//  Created by Jeffrey Sweeney on 4/2/23.
//

import UIKit

protocol DismissViewControllerProtocol: AnyObject {
    func dismissPressed()
}

class DismissViewController: UIViewController {
    
    weak var delegate: DismissViewControllerProtocol?
    
    let stackView = UIStackView()
    let label = UILabel()
    let dismissButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

// MARK: - Style & Layout
extension DismissViewController {
    
    private func style() {
        view.backgroundColor = .systemRed
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Tap below to dismiss this view controller!"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.configuration = .filled()
        dismissButton.setTitle("Dismiss me", for: [])
        dismissButton.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }
    
    private func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(dismissButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            dismissButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc private func buttonPressed() {
        delegate?.dismissPressed()
    }
}
