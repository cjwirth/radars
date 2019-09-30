//
//  ViewController.swift
//  KeyboardSadness
//
//  Created by Caesar Wirth on 9/30/19.
//  Copyright © 2019 Caesar Wirth. All rights reserved.
//

import UIKit

class KeyboardSwitchingTextField: UITextField {

    override var textInputMode: UITextInputMode? {
        // Let's force a German keyboard if one exists
        if let german = UITextInputMode.activeInputModes.first(where:  { $0.primaryLanguage?.hasPrefix("de-") ?? false }) {
            return german
        }
        return super.textInputMode
    }

}

class KeyboardSwitchingTextView: UITextView {

    override var textInputMode: UITextInputMode? {
        // Let's force a German keyboard if one exists
        if let german = UITextInputMode.activeInputModes.first(where:  { $0.primaryLanguage?.hasPrefix("de-") ?? false }) {
            return german
        }
        return super.textInputMode
    }

}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green

        let textView = KeyboardSwitchingTextView()
        view.addSubview(textView)
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor),
            textView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        ])

        let textField = KeyboardSwitchingTextField()
        textField.backgroundColor = .red
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            textField.leftAnchor.constraint(equalTo: view.leftAnchor),
            textField.rightAnchor.constraint(equalTo: view.rightAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44)
            ])

        let gr = UITapGestureRecognizer(target: self, action: #selector(finishEditing))
        view.addGestureRecognizer(gr)

    }

    @objc func finishEditing() {
        view.endEditing(true)
    }

}

