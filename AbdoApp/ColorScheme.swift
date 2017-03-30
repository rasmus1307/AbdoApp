import Foundation
import UIKit

public struct ColorScheme {
    
    public let blue = UIColor(red: 33/255.0, green: 162/255.0, blue: 220/255.0, alpha: 1) //#21a2dc
    public let purple = UIColor(red: 172/255.0, green: 112/255.0, blue: 140/255.0, alpha: 1) //#21a2dc
    public let green = UIColor(red: 112/255.0, green: 171/255.0, blue: 143/255.0, alpha: 1) //#70AB8F
    public let beige = UIColor(red: 228/255.0, green: 219/255.0, blue: 191/255.0, alpha: 1) //#E4DBBF
    public let orange = UIColor(red: 220/255.0, green: 91/255.0, blue: 33/255.0, alpha: 1) //#DC5B21
    public let black = UIColor(red: 56/255.0, green: 49/255.0, blue: 39/255.0, alpha: 1) //#383127
    public let white = UIColor(red: 244/255.0, green: 244/255.0, blue: 242/255.0, alpha: 1) //#F4F4F2

    public let backgroundColor = UIColor(red: 228/255.0, green: 219/255.0, blue: 191/255.0, alpha: 1)
    public let backgroundColor2 = UIColor(red: 228/255.0, green: 200/255.0, blue: 181/255.0, alpha: 1)
    public let backgroundColor3 = UIColor(red: 228/255.0, green: 180/255.0, blue: 171/255.0, alpha: 1)
    
    // Background color Masterdata Blue color
    public let masterData = UIColor(red: 33/255, green: 162/255, blue: 220/255, alpha: 1)
    public let shareCode = UIColor(red: 171/255, green: 112/255, blue: 140/255, alpha: 1)
    public let restoreFromMail = UIColor(red: 112/255, green: 171/255, blue: 143/255, alpha: 1)
    
    public let buttonColor = UIColor(red: 112/255, green: 171/255, blue: 143/255, alpha: 1)
    public let buttonColor2 = UIColor(red: 90/255, green: 150/255, blue: 164/255, alpha: 1)
    public let barColor = UIColor(red: 220/255.0, green: 91/255.0, blue: 33/255.0, alpha: 1)
    public let barColor2 = UIColor(red: 200/255.0, green: 66/255.0, blue: 28/255.0, alpha: 1)
    //public let tintColor = UIColor(red: 244/255.0, green: 244/255.0, blue: 242/255.0, alpha: 1)
    public let tintColor = UIColor.white
    public let buttonTextColor = UIColor.white
}

func changeBackgroundStyling(view : UIView)
{
    let gradientLayer = CAGradientLayer()
    gradientLayer.frame = view.bounds
    let color1 = ColorScheme().backgroundColor.cgColor
    let color2 = ColorScheme().backgroundColor2.cgColor
    let color3 = UIColor.clear.cgColor
    let color4 = ColorScheme().backgroundColor3.cgColor
    gradientLayer.colors = [color1, color2, color3, color4]
    gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
    view.layer.addSublayer(gradientLayer)

}

func changeBarStyling(bar : UINavigationBar)
{
    let gradient:CAGradientLayer = CAGradientLayer()
    let colorTop = ColorScheme().barColor.cgColor
    let colorBottom = ColorScheme().barColor2.cgColor
    gradient.colors = [colorTop, colorBottom]
    gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradient.frame = bar.bounds
    bar.layer.addSublayer(gradient)
}


func changeViewStyling(view : UIView)
{
    let gradient:CAGradientLayer = CAGradientLayer()
    let colorTop = ColorScheme().buttonColor.cgColor
    let colorBottom = ColorScheme().buttonColor2.cgColor
    gradient.colors = [colorTop, colorBottom]
    gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradient.frame = view.bounds
    view.layer.addSublayer(gradient)
}

func changeButtonStyling(button : UIButton)
{
    let gradient:CAGradientLayer = CAGradientLayer()
    let colorTop = ColorScheme().buttonColor.cgColor
    let colorBottom = ColorScheme().buttonColor2.cgColor
    gradient.colors = [colorTop, colorBottom]
    gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
    gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
    gradient.frame = button.bounds
    button.layer.addSublayer(gradient)
}

func changeButtonStylingOld(button : UIButton)
{
    button.backgroundColor = .clear
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.black.cgColor
    button.backgroundColor = ColorScheme().buttonColor
    button.titleLabel?.textColor = ColorScheme().buttonTextColor
}
