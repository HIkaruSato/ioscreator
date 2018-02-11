//
//  PhotoViewController.swift
//  IOS10ScaleImagesTutorial
//
//  Created by Arthur Knopper on 17/01/2017.
//  Copyright © 2017 Arthur Knopper. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    fileprivate var beginScale: CGFloat = 1.0
    fileprivate var scale: CGFloat = 1.0
    
    @IBAction func scaleImage(_ sender: UIPinchGestureRecognizer) {
        scale = beginScale * sender.scale
        myImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    @IBAction func doubleTapImage(_ sender: Any) {
        beginScale = 1.0
        scale = 1.0
        UIView.animate(withDuration: 0.2) { [weak self] in
            self?.myImageView.transform = CGAffineTransform.identity
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PhotoViewController : UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        switch gestureRecognizer {
        case is UIPinchGestureRecognizer :
            beginScale = scale
        default:
            break
        }
        
        return true
    }
}

