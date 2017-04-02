import UIKit

class SplashScreenViewController: UIViewController {

    @IBOutlet weak var textFieldAbdo: UILabel!
    @IBOutlet weak var imageViewAbdo: UIImageView!
    
    var applicationId = UIDevice.current.identifierForVendor?.uuidString
    
    let images = [UIImage(named: "animation0")
        ,UIImage(named: "animation0")
        ,UIImage(named: "animation1")
        ,UIImage(named: "animation2")
        ,UIImage(named: "animation3")
        ,UIImage(named: "animation4")
        ,UIImage(named: "animation5")
        ,UIImage(named: "animation6")
        ,UIImage(named: "animation7")
        ,UIImage(named: "animation8")
        ,UIImage(named: "animation9")
        ,UIImage(named: "animation10")
        ,UIImage(named: "animation11")]

    var timer = Timer()
    var totalTime = 0.0

    var i = 0
    var color1 = ColorScheme().white
    var color2 = ColorScheme().orange
    var bool = true
    
    func runTimedCode() {
        self.totalTime += 0.5
        let myString:NSString = "abdo"
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName:UIFont(name: textFieldAbdo.font.fontName, size: 32.0)!])
        if i <= 4 {
            myMutableString.addAttribute(NSForegroundColorAttributeName, value: color1, range: NSRange(location:0,length:i))
            myMutableString.addAttribute(NSForegroundColorAttributeName, value: color2, range: NSRange(location:i,length:4-i))
            i += 1
        }
        if i > 4 {
            if bool == true {
                color1 = ColorScheme().orange
                color2 = ColorScheme().white
                bool = !bool
            }
            else {
                color1 = ColorScheme().white
                color2 = ColorScheme().orange
                bool = !bool
            }
            i = 1
        }
        textFieldAbdo.attributedText = myMutableString
        
        
        // IS TO BE DELETEDE WHEN DEVICE ID IS SEND TO BACKEND
        if self.totalTime == 6.5 {
            _ = performSegue(withIdentifier: "showStartPage", sender: self)
        }
    }
    
    func startAnimation() {
        imageViewAbdo.animationImages = images as? [UIImage]
        imageViewAbdo.animationDuration = 2.0
        imageViewAbdo.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().orange
        Singleton.SharedInstance.anonymous.deviceId = self.applicationId!
        print("\(Singleton.SharedInstance.anonymous.deviceId)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startAnimation()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        imageViewAbdo.stopAnimating()
        timer.invalidate()
    }
    
}
