//
//  Way3ViewController.swift
//  UIMenu_Demo
//
//  Created by JINSEOK on 2023/07/10.
//

import UIKit

class Way3ViewController: UIViewController {
    
    // MARK: - UI Properties
    let imageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 100, y: 500, width: 200, height: 200))
        view.image = UIImage(named: "myProfile")
        return view
    }()

    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 150, y: 400, width: 100, height: 40))
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    // MARK: - Properties
    
    var items: [UIAction] {
        
        let save = UIAction(
            title: "Save",
            image: UIImage(systemName: "plus"),
            handler: { [unowned self] _ in
                self.label.text = "Save"
            })
        
        let delete = UIAction(
            title: "Delete",
            image: UIImage(systemName: "trash"),
            handler: { [unowned self] _ in
                self.label.text = "Delete"
            })
        
        let Items = [save, delete]
        
        return Items
    }
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(label)
        
        self.title = "UIMenu 테스트"
        
        let navBarAppearance = UINavigationBarAppearance()
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        setupMenu()
    }
    
    func setupMenu() {
        let menu = UIMenu(title: "메뉴",
                          children: items)
        
        // UIBarButtonItem의 생성자를 통해 메뉴를 생성하기
        let barButton = UIBarButtonItem(title: nil,
                                        image: UIImage(systemName: "list.dash"),
                                        primaryAction: nil,
                                        menu: menu)
  
        navigationItem.rightBarButtonItem = barButton
    }
}


// MARK: - PreView 읽기
import SwiftUI

#if DEBUG
struct PreView3: PreviewProvider {
    static var previews: some View {
        // 사용할 뷰 컨트롤러를 넣어주세요
        Way2ViewController()
            .toPreview()
    }
}
#endif

