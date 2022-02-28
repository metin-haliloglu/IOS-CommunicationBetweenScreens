//
//  DetayViewController.swift
//  deneme
//
//  Created by Metin HALILOGLU on 28.02.2022.
//

import UIKit

protocol DetayViewControllerDelegate: class {
    func actionSuccess()
    func actionFail()
}

class DetayViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    weak var  delegate : DetayViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.titleLabel.text = "EMPTY"
    }
    
    static func instantiate() -> DetayViewController{
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetayViewController") as! DetayViewController
        vc.modalPresentationStyle = .fullScreen
        
        return vc
    }
    
    func changeTitle(title: String){
        self.titleLabel.text = title
    }

    @IBAction func successButtonTapped(_ sender: Any) {
        if let delegate = self.delegate{
            delegate.actionSuccess()
        }
    }
    @IBAction func failButtonTapped(_ sender: Any) {
        if let delegate = self.delegate{
            delegate.actionFail()
        }
    }
}
