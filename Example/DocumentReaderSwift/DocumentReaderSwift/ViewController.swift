//
//  ViewController.swift
//  DocumentReaderSwift
//
//  Created by Dmitry Smolyakov on 5/5/17.
//  Copyright © 2017 Dmitry Smolyakov. All rights reserved.
//

import UIKit
import DocumentReader

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let docReader = DocReader(licensePath: String())
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

