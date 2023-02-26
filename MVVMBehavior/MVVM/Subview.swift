//
//  Subview.swift
//  MVVMBehavior
//
//  Created by wiiale on 2023/2/25.
//

import UIKit

protocol SubviewDelegate: AnyObject {
    func subview(_ subview: Subview, didTapUpdate nickname: String)
}

class Subview: UIView {
    weak var delegate: SubviewDelegate?

    private lazy var inputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .bezel
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Update", for: [])
        button.addTarget(self, action: #selector(updateButtonWasTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var userNicknameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeUI() {
        addSubview(inputTextField)
        addSubview(updateButton)
        addSubview(userNicknameLabel)
        NSLayoutConstraint.activate([
            inputTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            inputTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            inputTextField.widthAnchor.constraint(equalToConstant: 150),
            inputTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            updateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            updateButton.topAnchor.constraint(equalTo: inputTextField.bottomAnchor),
            updateButton.widthAnchor.constraint(equalToConstant: 150),
            updateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        NSLayoutConstraint.activate([
            userNicknameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNicknameLabel.topAnchor.constraint(equalTo: updateButton.bottomAnchor),
            userNicknameLabel.widthAnchor.constraint(equalToConstant: 150),
            userNicknameLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc
    private func updateButtonWasTapped() {
        guard let newNickname = inputTextField.text else {
            fatalError("inputTextField.text is nil")
        }
        guard newNickname.count > 0 else {
            fatalError("newNickname.count == 0")
        }
        delegate?.subview(self, didTapUpdate: newNickname)
    }

    /// 刷新最新的用户昵称
   func updateNewNickname(_ nickname: String) {
       userNicknameLabel.text = nickname
   }
}
