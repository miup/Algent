//
//  ViewController.swift
//  Algent
//
//  Created by miup on 11/11/2017.
//  Copyright (c) 2017 miup. All rights reserved.
//

import UIKit
import Algent

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let request = SarchUserRequest(page: 0, per: 20, text: "", hashtags: [])
        Algent.shared.search(request: request) { result in
            switch result {
            case .success(let response):
                // response is AlgoliaResponse<Request.HitType>
                print(response.hits) // see hit object
            case .failure( let error):
                print(error) // get error
            }
        }
    }

}

