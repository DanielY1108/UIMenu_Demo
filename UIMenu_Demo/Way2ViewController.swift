//
//  Way2ViewController.swift
//  UIMenu_Demo
//
//  Created by JINSEOK on 2023/04/17.
//

import UIKit

class Way2ViewController: UIViewController {
    
    // MARK: - UI Properties
    let imageView: UIImageView = {
        let view = UIImageView(frame: CGRect(x: 100, y: 500, width: 200, height: 200))
        view.image = UIImage(named: "myProfile")
        return view
    }()
    
    let button: UIButton = {
        let button =  UIButton(frame: CGRect(x: 150, y: 200, width: 100, height: 40))
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("Button", for: .normal)
        return button
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
        view.backgroundColor = .white
        view.addSubview(imageView)
        view.addSubview(button)
        view.addSubview(label)
//        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
        setupMenu()
    }
    
    // MARK: - Setup
    
    func setupMenu() {
        let menu = UIMenu(title: "메뉴",
                          subtitle: "서브 타이틀",
                          image: UIImage(systemName: "star"),
                          identifier: nil,
                          options: .singleSelection,
                          preferredElementSize: .large,
                          children: items)
        
        let mainMenu = UIMenu(title: "메인",
                              children: [menu])
        
        button.menu = mainMenu
        button.showsMenuAsPrimaryAction = true
    }
    
    // MARK: - Button handlers
    
    @objc func buttonHandler(_ sender: UIButton) {
    }
}



import SwiftUI

#if DEBUG
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }
    
    func toPreview() -> some View {
        Preview(viewController: self)
    }
}
#endif


// MARK: - PreView 읽기
import SwiftUI

#if DEBUG
struct PreView: PreviewProvider {
    static var previews: some View {
        // 사용할 뷰 컨트롤러를 넣어주세요
        Way2ViewController()
            .toPreview()
    }
}
#endif

