//
//  AccountDetailsInteractor.swift
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

protocol AccountDetailsBusinessLogic {
    func showAccountInfo(request: AccountDetails.AccountInfo.Request)
    func listStatements(request: AccountDetails.ListStatements.Request)
}

protocol AccountDetailsDataStore {
    var user: User? { get set }
}

class AccountDetailsInteractor: AccountDetailsBusinessLogic, AccountDetailsDataStore {
    var presenter: AccountDetailsPresentationLogic?
    var worker: AccountDetailsWorkerLogic?
    var user: User?

    // MARK: Account Info

    func showAccountInfo(request: AccountDetails.AccountInfo.Request) {
        guard let user = user else { return }

        let response = AccountDetails.AccountInfo.Response(user: user)
        presenter?.presentAccountInfo(response: response)
    }

    // MARK: Statements

    func listStatements(request: AccountDetails.ListStatements.Request) {
        guard let user = user else { return }

        worker?.listStatements(userId: user.id, { (statements, error) in
            guard let statements = statements, error == nil else {
                let response = AccountDetails.ListStatements.Response(statements: [], success: false)
                self.presenter?.presentStatements(response: response)
                return
            }

            let response = AccountDetails.ListStatements.Response(
                statements: statements,
                success: true
            )

            self.presenter?.presentStatements(response: response)
        })
    }
}
