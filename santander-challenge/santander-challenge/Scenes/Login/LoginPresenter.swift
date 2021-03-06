//
//  LoginPresenter.swift
//  santander-challenge
//
//  Created by Kevin Oliveira on 01/05/20.
//  Copyright (c) 2020 Kevin Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoginPresentationLogic {
    func presentUser(response: Login.GetUser.Response)
    func presentLogin(response: Login.Login.Response)
}

class LoginPresenter: LoginPresentationLogic {
    weak var viewController: LoginDisplayLogic?
  
    // MARK: Get User

    func presentUser(response: Login.GetUser.Response) {
        let viewModel = Login.GetUser.ViewModel(user: response.user)
        viewController?.displayUser(viewModel: viewModel)
    }

    // MARK: Login

    func presentLogin(response: Login.Login.Response) {
        let viewModel = Login.Login.ViewModel(success: response.success, errorMessage: response.errorMessage)
        viewController?.displayLogin(viewModel: viewModel)
    }
}
