//
//  PresentViewController.swift
//  PushPopPresentDismissVisualized
//
//  Created by Jeffrey Sweeney on 4/2/23.
//

import UIKit

protocol PresentViewControllerProtocol: AnyObject {
    func presentPressed()
}

class PresentViewController: UIViewController {
    
    weak var delegate: PresentViewControllerProtocol?
    
    let stackView = UIStackView()
    let label = UILabel()
    let presentButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

// MARK: - Style & Layout
extension PresentViewController {
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 24
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Tap below to present a view controller!"
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.configuration = .filled()
        presentButton.setTitle("Present VC", for: [])
        presentButton.addTarget(self, action: #selector(buttonPressed), for: .primaryActionTriggered)
    }
    
    private func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(presentButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            presentButton.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 8),
            stackView.trailingAnchor.constraint(equalToSystemSpacingAfter: presentButton.trailingAnchor, multiplier: 8),
            presentButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    @objc private func buttonPressed() {
        delegate?.presentPressed()
    }
}
