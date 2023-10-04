//
//  MySwiftClass.swift
//  learn-obj
//
//  Created by User on 14/09/23.
//

import Foundation
import UIKit
import Common

class SwiftViewController: UIViewController {
//    @objc var delegate: () -> Void = {}
//    var data: Simple;
    
    convenience init(delegate: @escaping () -> Void, data: Simple) {
        self.init(nibName: nil, bundle: nil)
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Apa Cobaa.."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Log from swift")
        self.view.backgroundColor = .white;
        
//        self.delegate()
        
        self.layout()
    }
    
    func layout() {
        self.view.addSubview(label);
        
        self.setupConstraintsForLabel();
    }
    
    func setupConstraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
