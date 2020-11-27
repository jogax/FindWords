    //
//  DrawImages.swift
//  JLinesV2
//
//  Created by Jozsef Romhanyi on 30.04.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import UIKit



class DrawImages {
    static let oneGrad:CGFloat = CGFloat(Double.pi) / 180

    var pfeillinksImage = UIImage()
    var pfeilrechtsImage = UIImage()
    var settingsImage = UIImage()
    var backImage = UIImage()
    var undoImage = UIImage()
    var restartImage = UIImage()
    var exchangeImage = UIImage()
    var uhrImage = UIImage()
    var cardPackage = UIImage()
    var tippImage = UIImage()
    
    //let imageColor = GV.khakiColor.CGColor
    static let opaque = false
    static let scale: CGFloat = 1
    
    init() {
    }
    
    static func drawButton(size: CGSize) -> UIImage {
        //let endAngle = CGFloat(2*M_PI)
        
        UIGraphicsBeginImageContextWithOptions(size, DrawImages.opaque, DrawImages.scale)
        let ctx = UIGraphicsGetCurrentContext()
        ctx!.setStrokeColor(UIColor.black.cgColor)
        
        ctx!.beginPath()
        ctx!.setLineWidth(4.0)
        
        let adder:CGFloat = size.width / 20
        let r0 = size.height / 10
        
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let center1 = CGPoint(x: size.width - r0, y: size.height - r0)
        let center2 = CGPoint(x: size.width - r0, y: 0 + r0)
        let center3 = CGPoint(x: 0 + r0, y: 0 + r0)
        let center4 = CGPoint(x: 0 + r0, y: size.height - r0)

        
//        let oneGrad:CGFloat = CGFloat(M_PI) / 180
        let minAngle1 = 0 * oneGrad
        let maxAngle1 = 90 * oneGrad
        //println("1 Grad: \(oneGrad)")
        
        let minAngle2 = 90 * oneGrad
        let maxAngle2 = 180 * oneGrad
        
        let minAngle3 = 180 * oneGrad
        let maxAngle3 = 270 * oneGrad
        
        let minAngle4 = 270 * oneGrad
        let maxAngle4 = 360 * oneGrad

//        CGContextAddArc(ctx, center1.x, center1.y, r0, minAngle1, maxAngle1, 1)
        ctx!.addArc(center: center1, radius: r0, startAngle: minAngle1, endAngle: maxAngle1, clockwise: true)
        ctx!.strokePath()
        
//        CGContextAddArc(ctx, center2.x, center2.y, r0, minAngle2, maxAngle2, 1)
        ctx!.addArc(center: center2, radius: r0, startAngle: minAngle2, endAngle: maxAngle2, clockwise: true)
        ctx!.strokePath()
        
        let p0 = CGPoint(x: center.x, y: size.height)
        let p1 = CGPoint(x: size.width - r0, y: size.height)
        let p2 = CGPoint(x: size.width, y: 0 - r0)
        let p3 = CGPoint(x: 0 + r0, y: 0 + r0)
        let p4 = CGPoint(x: 0 + r0, y: size.height - r0)
        
        ctx!.move(to: p0)
        ctx!.addLine(to: p1)
        ctx!.addArc(center: center1, radius: r0, startAngle: minAngle1, endAngle: maxAngle1, clockwise: true)
        ctx!.addLine(to: p2)
        ctx!.addArc(center: center2, radius: r0, startAngle: minAngle2, endAngle: maxAngle2, clockwise: true)
        ctx!.addLine(to: p3)
        ctx!.addArc(center: center3, radius: r0, startAngle: minAngle3, endAngle: maxAngle3, clockwise: true)
        ctx!.addLine(to: p4)
        ctx!.addArc(center: center4, radius: r0, startAngle: minAngle4, endAngle: maxAngle4, clockwise: true)
        ctx!.addLine(to: p0)
        ctx!.strokePath()
        ctx!.strokePath()
        
        
        
        
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return image!
    }
    
    static func pointOfCircle(_ radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
        let pointOfCircle = CGPoint (x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        return pointOfCircle
    }
    

}




