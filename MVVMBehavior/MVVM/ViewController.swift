//
//  ViewController.swift
//  MVVMBehavior
//
//  Created by wiiale on 2023/2/25.
//

import UIKit

class ViewController: UIViewController {
    private lazy var subview: Subview = {
        let view = Subview(frame: view.bounds)
        view.delegate = self
        return view
    }()

    private lazy var viewModel: ViewModel = {
        let viewModel = ViewModel()
        viewModel.delegate = self
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    private func makeUI() {
        view.addSubview(subview)
    }
}

// MARK: - ViewModelDelegate

extension ViewController: ViewModelDelegate {
    func viewModelDidUpdateNickname(in viewModel: ViewModel) {
        subview.updateNewNickname(viewModel.nickname)
    }
}

// MARK: - SubViewDelegate

extension ViewController: SubviewDelegate {
    func subview(_ subview: Subview, didTapUpdate nickname: String) {
        viewModel.requestUpdateNickname(nickname)
    }
}
