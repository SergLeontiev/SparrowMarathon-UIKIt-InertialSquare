//
//  ViewController.swift
//  SparrowMarathon-UIKIt-InertialSquare
//
//  Created by Sergey Leontiev on 16.11.24..
//

import UIKit

class ViewController: UIViewController {
    private lazy var animator = UIDynamicAnimator(referenceView: view)
    private lazy var snap = UISnapBehavior(item: resultView, snapTo: view.center)
    
    private lazy var resultView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 80, height: 80)))
        view.center = self.view.center
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(resultView)
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tap)
        
        animator.addBehavior(snap)
    }
    
   @objc private func viewTapped(touch: UITapGestureRecognizer) {
       snap.snapPoint = touch.location(in: view)
    }
}
