//
//  Coordinator.swift
//  iOSDemo
//
//  Created by Rafael Ferraz on 8/1/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol Coordinator: AnyObject {
    // if you want to run a new flow you need to create a Coordinator using a factory and call start()
    func start()
}
