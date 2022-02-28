//
//  ViewController.swift
//  deneme
//
//  Created by Metin HALILOGLU on 28.02.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var errorLabel: UILabel!
    weak var detayView : DetayViewController?
    
    var errorCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareErrorLabel()
    }
    
    @IBAction func openDetailView(_ sender: Any) {
        detayView = DetayViewController.instantiate()
        detayView?.delegate = self
        self.present(detayView!, animated: true, completion: {
            self.detayView?.changeTitle(title: "NEW")
        })
    }    
    
    private func closeDetayView(){
        if let detayView = detayView {
            detayView.dismiss(animated: true)
        }
    }
    
    private func prepareErrorLabel(){
        self.errorLabel.text = "ERROR COUNT : \(self.errorCount)"
    }
}

extension ViewController: DetayViewControllerDelegate{
    func actionSuccess() {
        print("actionSuccess")
        
        closeDetayView()
    }
    
    func actionFail() {
        print("actionFail")
        
        self.errorCount += 1
        
        self.prepareErrorLabel()
        
        if let detayView = detayView{
            detayView.changeTitle(title: "EDIT")
        }
    }
}

