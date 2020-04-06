//
//  SelectionViewController.swift
//  Nike Music 100
//
//  Created by Jonathan Sack on 4/3/20.
//  Copyright © 2020 Jonathan Sack. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    // MARK: - Constants
    let padding: CGFloat = 20
    let buttonHeight: CGFloat = 40


    // MARK: - Property
    var viewModel: ViewModel?


    // MARK: - Lifecycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    private func setupUI() {

        // MARK: - Background
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

        // MARK: - Labels
        let header = NLabel(title: "Try Alternative Design?", font: .systemFont(ofSize: 20, weight: .semibold), textColor: .NBlack)
        let subheader = NLabel(title: "The Alternative design goes beyond the current coding challenge requirements and lets you see what changes I would be making if I were to design a \"For Production App\".", font: .systemFont(ofSize: 16), textColor: .NGray)
        subheader.setLineHeight(lineHeight: padding / 4)

        // MARK: - Buttons
        let acceptButton = getButton(title: "Yes", mainButton: true)
        let cancelButton = getButton(title: "No", mainButton: false)

        let paddingView = UIButton()
        paddingView.setContentHuggingPriority(.init(100), for: .horizontal)

        let buttonStackView = UIStackView(arrangedSubviews: [acceptButton, cancelButton, paddingView])
        buttonStackView.setDefaultConfig(spacing: padding / 2, axis: .horizontal)

        // MARK: - Prompt View
        let promptView = UIView()
        promptView.backgroundColor = .NWhite
        promptView.layer.cornerRadius = 8

        // MARK: - Stack View
        let stackView = UIStackView(arrangedSubviews: [header, subheader, buttonStackView])
        stackView.setDefaultConfig(spacing: padding)
        stackView.pinTo(superview: promptView, xPadding: padding, yPadding: padding)

        // MARK: - Add to superview
        promptView.centerIn(superview: view)
        promptView.setSize(width: view.bounds.width - (padding * 2), height: 260)
    }

    private func getButton(title: String, mainButton: Bool) -> UIButton {

        // Shared Config.
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.setSize(height: buttonHeight)
        button.layer.cornerRadius = buttonHeight / 2
        button.setSize(width: 85)
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)

        // Colors
        if mainButton {
            button.setTitleColor(.NWhite, for: .normal)
            button.backgroundColor = .NBlack
        } else {
            button.setTitleColor(.NBlack, for: .normal)
            button.layer.borderColor = UIColor.NSilver?.cgColor
            button.layer.borderWidth = 1
        }

        return button
    }

    
    // MARK: - Actions
    @objc func dismissScreen(sender: UIButton) {
        viewModel?.showAlternativeDesign = sender.titleLabel?.text == "Yes" ? true : false
        dismiss(animated: true)
    }
}
