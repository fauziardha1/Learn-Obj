//
//  HowToTestFirst.swift
//  learn-objTests
//
//  Created by User on 17/09/23.
//

import XCTest

class TitleViewController: UIViewController {
    lazy var titleLabel = UILabel()
    
    func render(title: String) {
        titleLabel.text = title
    }
}

final class HowToTestFirst: XCTestCase {

    func test_viewControler_renderTitle() {
        // given
        let sut = TitleViewController()
        
        // when
        sut.render(title: "a title")
        
        // then
        XCTAssertEqual(sut.titleLabel.text, "a title")
    }

}
