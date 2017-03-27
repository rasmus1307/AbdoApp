import UIKit
import SAConfettiView

class ViewControllerRegEnd: UIViewController {
    
    @IBOutlet weak var viewConfetti: UIView!
    @IBOutlet weak var labelCountDown: UILabel!
    @IBAction func buttonConfirm(_ sender: UIButton) {
        stopTimerTest()
        changeView(sender: sender)
    }
    
    var timerTest : Timer?
    var counter = 9
    
    func updateCounter() {
        //you code, this is an example
        if counter > 0 {
            self.labelCountDown.text = "Åbener ny registrering om \(counter)s"
            counter -= 1
        }
        else {
            changeView(sender: UIButton())
            stopTimerTest()
        }
    }
    
    func startTimer () {
        
        if timerTest == nil {
        timerTest = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        }
    }
    
    func stopTimerTest() {
        if timerTest != nil {
            timerTest?.invalidate()
            timerTest = nil
        }
    }
    
    func changeView(sender: UIButton)
    {
        performSegue(withIdentifier: "showRegStart", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = ColorScheme().backgroundColor
        let confettiView = SAConfettiView(frame: self.viewConfetti.bounds)
        confettiView.type = .Confetti
        confettiView.colors = [UIColor.red, UIColor.green, UIColor.blue, UIColor.yellow, UIColor.orange, UIColor.purple, UIColor.white, UIColor.cyan]
        confettiView.intensity = 0.90
        confettiView.startConfetti()
        self.viewConfetti.addSubview(confettiView)
        
        startTimer()
    }

}
