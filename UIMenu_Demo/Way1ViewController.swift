//
//  ViewController.swift
//  UIMenu_Demo
//
//  Created by JINSEOK on 2023/04/17.
//

import UIKit

class Way1ViewController: UIViewController {
    
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
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
        let interaction = UIContextMenuInteraction(delegate: self)
        button.addInteraction(interaction)
    }
    
    // MARK: - Setup
    
    func setupMenu() {
       
    }
    
    // MARK: - Button handlers
    
    @objc func buttonHandler(_ sender: UIButton) {
      
    }
}


extension Way1ViewController: UIContextMenuInteractionDelegate {
    
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(actionProvider:  { [unowned self] suggestedActions in
            
            let menu = UIMenu(title: "메뉴",
                              children: self.items)
            
            return menu
        })
    }
}





// MARK: - PreView 읽기
import SwiftUI

#if DEBUG
struct PreView1: PreviewProvider {
    static var previews: some View {
        // 사용할 뷰 컨트롤러를 넣어주세요
        Way1ViewController()
            .toPreview()
    }
}
#endif

