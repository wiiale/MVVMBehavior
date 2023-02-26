//
//  Store.swift
//  MVVMBehavior
//
//  Created by wiiale on 2023/2/25.
//

import Foundation

struct Store {
    /// 更新用户昵称，模仿网络请求
    /// - Parameters:
    ///   - nickname: 修改的用户昵称
    ///   - completion: 更新完成返回最新昵称
    static func requestUpdateNickname(_ nickname: String,
                               completion: @escaping (String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(nickname)
        }
    }
}
