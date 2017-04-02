import UIKit
import Alamofire

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
    
    func changeView() {
        _ = performSegue(withIdentifier: "showStartPage", sender: self)
    }
    
    func startAnimation() {
        imageViewAbdo.animationImages = images as? [UIImage]
        imageViewAbdo.animationDuration = 2.0
        imageViewAbdo.startAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorScheme().orange
        createAnonymous()
    }
    
    func createAnonymous() {
        let anonymous = Anonymous()
        anonymous.post()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startAnimation()
        Timer.scheduledTimer(timeInterval: 6.5, target: self, selector: #selector(changeView), userInfo: nil, repeats: false)
        self.textFieldAbdo.textColor = ColorScheme().white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        imageViewAbdo.stopAnimating()
        timer.invalidate()
    }
    
}
