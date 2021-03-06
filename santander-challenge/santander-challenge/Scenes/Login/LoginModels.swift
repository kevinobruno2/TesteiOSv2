//
//  LoginModels.swift
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

enum Login {

    // MARK: Use cases

    enum GetUser {
        struct Request {}

        struct Response {
            var user: String?
        }

        struct ViewModel {
            var user: String?
        }
    }

    enum Login {
        struct Request {
            var user: String?
            var password: String?
        }

        struct Response {
            var success: Bool
            var errorMessage: String?
        }

        struct ViewModel {
            var success: Bool
            var errorMessage: String?
        }
    }
}
