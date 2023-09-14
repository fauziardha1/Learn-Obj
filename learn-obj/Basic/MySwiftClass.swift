//
//  MySwiftClass.swift
//  learn-obj
//
//  Created by User on 14/09/23.
//

import Foundation
import UIKit

class SwiftUIViewController: UIViewController {
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Apa Cobaa.."
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Log from swift")
        self.view.backgroundColor = .white;
        
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
