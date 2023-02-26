//
//  ViewModel.swift
//  MVVMBehavior
//
//  Created by wiiale on 2023/2/25.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func viewModelDidUpdateNickname(in viewModel: ViewModel)
}

class ViewModel {
    weak var delegate: ViewModelDelegate?

    private(set) var nickname: String = ""

    func requestUpdateNickname(_ nickname: String) {
        Store.requestUpdateNickname(nickname) { newNickname in  // 通知数据更新
            self.nickname = newNickname                         // 更新数据
            self.delegate?.viewModelDidUpdateNickname(in: self) // 反馈最新数据到 ViewController
        }
    }
}
