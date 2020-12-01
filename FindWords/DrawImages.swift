    //
//  DrawImages.swift
//  JLinesV2
//
//  Created by Jozsef Romhanyi on 30.04.15.
//  Copyright (c) 2015 Jozsef Romhanyi. All rights reserved.
//

import UIKit
import SpriteKit


enum ImageType: Int {
    case GradientRect = 0
}
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
    
    struct MySize: Hashable {
        var width: CGFloat
        var height: CGFloat
        init(_ size: CGSize) {
            self.width = size.width
            self.height = size.height
        }
    }
    fileprivate static var generatedTextures = [ImageTypes: SKTexture]()
    struct ImageTypes: Hashable {
        var imageType: ImageType
        var size: MySize
        
    }

    static func drawButton(size: CGSize, outerColor: UIColor = .green, innerColor: UIColor = .lightGray) -> SKTexture {
        //let endAngle = CGFloat(2*M_PI)
        let imageType = ImageTypes(imageType: .GradientRect, size: MySize(size))
        if generatedTextures[imageType] != nil {
            return generatedTextures[imageType]!
        } else {
            UIGraphicsBeginImageContextWithOptions(size, DrawImages.opaque, DrawImages.scale)
            let innerDelta: CGFloat = 5
            let ctx = UIGraphicsGetCurrentContext()!
            
            //        =============================================================
            let locations:[CGFloat] = [0.0, 0.3, 1.0]
            let colors = [UIColor(red: 220/256, green: 220/256, blue: 220/256, alpha: 0.8).cgColor,
                          UIColor(red: 50/256, green: 50/256, blue: 50/256, alpha: 0.8).cgColor,
                          UIColor(red: 180/256, green: 180/256, blue: 180/256, alpha: 0.8).cgColor]
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: locations)!

            var startPoint = CGPoint()
            var endPoint =  CGPoint()

            startPoint.x = size.width / 2
            startPoint.y = innerDelta * 1.2
            endPoint.x = size.width / 2
            endPoint.y = size.height - innerDelta * 1.2

            ctx.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: UInt32(0)))
                         
            ctx.strokePath()
            
            let image = UIGraphicsGetImageFromCurrentImageContext()!.roundedImageWithBorder(width: 5.0, color: .darkGray, radius: 14)!
            
            UIGraphicsEndImageContext()
//            let blur = CIImage(image: image)!.applyingGaussianBlur(sigma: 50)
            let returnTexture = SKTexture(cgImage: convertCIImageToCGImage(inputImage: CIImage(image: image)!))
            generatedTextures[imageType] = returnTexture
            return returnTexture
        }
    }
    
    static func pointOfCircle(_ radius: CGFloat, center: CGPoint, angle: CGFloat) -> CGPoint {
        let pointOfCircle = CGPoint (x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
        return pointOfCircle
    }
    

}




