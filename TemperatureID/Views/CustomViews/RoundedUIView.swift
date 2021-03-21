//
//  RoundedUIView.swift
//  TemperatureID
//
//  Created by dadDev on 3/20/21.
//

import UIKit

class RoundedUIView {

    
    //uiview rounded
       static func roundedView(_ myView: UIView) -> Void {
            myView.layer.cornerRadius = 25.0
            myView.layer.borderWidth = 2.0
            myView.layer.borderColor = UIColor.black.cgColor
        }
    
    static func roundedImage(_ myImage: UIImageView) -> Void {
        
        myImage.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        myImage.layer.cornerRadius = 25.0
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UIImage {
    
    func roundCorners(proportion: CGFloat) -> UIImage {
            let minValue = min(self.size.width, self.size.height)
            let radius = minValue/proportion
            
            let rect = CGRect(origin: CGPoint(x: 0, y: 0), size: self.size)
            UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
            UIBezierPath(roundedRect: rect, cornerRadius: radius).addClip()
            self.draw(in: rect)
            let image = UIGraphicsGetImageFromCurrentImageContext() ?? self
            UIGraphicsEndImageContext()
            return image
        }
}
