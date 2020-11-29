    //
//  DrawImages.swift
//  JLinesV2
//
//  Created by Jozsef Romhanyi on 30.04.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import UIKit
import SpriteKit



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
    static func convertCIImageToCGImage(inputImage: CIImage) -> CGImage! {
        let context = CIContext(options: nil)
        if context != nil {
            return context.createCGImage(inputImage, from: inputImage.extent)
        }
        return nil
    }

    static func drawButton(size: CGSize, outerColor: UIColor = .green, innerColor: UIColor = .lightGray) -> SKTexture {
        //let endAngle = CGFloat(2*M_PI)
        
        UIGraphicsBeginImageContextWithOptions(size, DrawImages.opaque, DrawImages.scale)
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.setStrokeColor(UIColor.clear.cgColor)
        
        ctx.beginPath()
        ctx.setLineWidth(0.01)
        
//        let adder:CGFloat = size.width / 20
        let r0:CGFloat = size.height / 2 > 20.0 ? 20.0 : size.height / 2 //size.height / 50
        
        let center1 = CGPoint(x: r0, y: r0)
        let center2 = CGPoint(x: size.width - r0, y: r0)
        let center3 = CGPoint(x: size.width - r0, y: size.height - r0)
        let center4 = CGPoint(x: r0, y: size.height - r0)

        let p0 = CGPoint(x: 0, y: size.height - r0)
        let p1 = CGPoint(x: 0, y: r0)
        let p2 = CGPoint(x: size.width - r0, y: 0)
        let p3 = CGPoint(x: size.width, y: r0)
        let p4 = CGPoint(x: r0, y: size.height)
        
        ctx.move(to: p0)
        ctx.addLine(to: p1)
        ctx.addArc(center: center1, radius: r0, startAngle: 180 * oneGrad, endAngle: 270 * oneGrad, clockwise: false)
        ctx.addLine(to: p2)
        ctx.addArc(center: center2, radius: r0, startAngle: 270 * oneGrad, endAngle: 360 * oneGrad, clockwise: false)
        ctx.addLine(to: p3)
        ctx.addArc(center: center3, radius: r0, startAngle: 360 * oneGrad, endAngle: 90 * oneGrad, clockwise: false)
        ctx.addLine(to: p4)
        ctx.addArc(center: center4, radius: r0, startAngle: 90 * oneGrad, endAngle: 180 * oneGrad, clockwise: false)
        ctx.addLine(to: p0)
        ctx.setFillColor(outerColor.cgColor)
        ctx.fillPath()
        ctx.strokePath()
        ctx.setLineWidth(0.5)
        let innerDelta: CGFloat = 5
        let r1 = r0 - innerDelta
        
        let p10 = CGPoint(x: 0 + innerDelta, y: size.height - r0)
        let p11 = CGPoint(x: 0 + innerDelta, y: r0)
        let p12 = CGPoint(x: size.width - r0, y: innerDelta)
        let p13 = CGPoint(x: size.width - innerDelta , y: size.height - r0)
        let p14 = CGPoint(x: r0, y: size.height - innerDelta)
        
        ctx.move(to: p10)
        ctx.addLine(to: p11)
        ctx.addArc(center: center1, radius: r1, startAngle: 180 * oneGrad, endAngle: 270 * oneGrad, clockwise: false)
        ctx.addLine(to: p12)
        ctx.addArc(center: center2, radius: r1, startAngle: 270 * oneGrad, endAngle: 360 * oneGrad, clockwise: false)
//        let point1 = pointOfCircle(5, center: center2, angle: 270 * oneGrad)
//        let point2 = pointOfCircle(5, center: center2, angle: 360 * oneGrad)
        ctx.addLine(to: p13)
        ctx.addArc(center: center3, radius: r1, startAngle: 360 * oneGrad, endAngle: 90 * oneGrad, clockwise: false)
        ctx.addLine(to: p14)
        ctx.addArc(center: center4, radius: r1, startAngle: 90 * oneGrad, endAngle: 180 * oneGrad, clockwise: false)
        ctx.addLine(to: p10)
        ctx.setFillColor(innerColor.cgColor)
        ctx.fillPath()
        ctx.strokePath()
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        let returnTexture = SKTexture(cgImage: convertCIImageToCGImage(inputImage: CIImage(image: image)!))

        return returnTexture
    }
    
    static func pointOfCircle(_ radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
        let pointOfCircle = CGPoint (x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        return pointOfCircle
    }
    

}




