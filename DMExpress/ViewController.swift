//
//  ViewController.swift
//  DMExpress
//
//  Created by Narlei A Moreira on 07/02/19.
//  Copyright © 2019 Narlei A Moreira. All rights reserved.
//

import BringgTracking
import UIKit

let token = ""

class ViewController: UIViewController {
    var trackClient: BringgTrackingClient!

    override func viewDidLoad() {
        super.viewDidLoad()
        trackClient = BringgTrackingClient(developerToken: token, connectionDelegate: self)
        
        trackClient.connect()
        
        

    }
}

extension ViewController: RealTimeDelegate {
    func trackerDidConnect() {
        print("Connected")
        trackClient.startWatchingOrder(withUUID: "18727c2b-b382-4a21-a0b8-e1834210d6ab", customerAccessToken: token, delegate: self)
//        trackClient.startWatchingOrder(withShareUUID: "18727c2b-b382-4a21-a0b8-e1834210d6ab", delegate: self)

    }

    func trackerDidDisconnectWithError(_ error: Error?) {
        print(error)
    }
}

extension ViewController: OrderDelegate {
    func watchOrderSucceed(for order: GGOrder) {
        print(order)
    }

    func watchOrderFail(for order: GGOrder, error: Error) {
        print(error)
    }

    func orderDidAssign(with order: GGOrder, with driver: GGDriver) {
        print(driver)
    }

    func orderDidAccept(with order: GGOrder, with driver: GGDriver) {
        print(driver)
    }

    func orderDidStart(with order: GGOrder, with driver: GGDriver) {
        print(driver)
    }
}
