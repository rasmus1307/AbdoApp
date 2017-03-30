import UIKit
import AVFoundation


class ViewControllerRegStart: UIViewController {

    @IBOutlet weak var iconLeft: UIImageView!
    @IBOutlet weak var iconMegaphone: UIButton!
    @IBAction func buttonMegaphone(_ sender: UIButton) {
        megaphone()
    }
    
    func megaphone() {
        let utterance = AVSpeechUtterance(string: "Hvor gør det ondt")
        utterance.voice = AVSpeechSynthesisVoice(language: "da-DK")
        utterance.rate = 0.4
        
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    @IBAction func painAreaClicked(_ sender: UIButton) {
        changeView(sender: sender)
    }
    
    func changeView(sender: UIButton)
    {
        performSegue(withIdentifier: "showPain", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconLeft.image = UIImage(named: "icon_stomachPain")?.withRenderingMode(.alwaysTemplate)
        iconLeft.tintColor = .white
        iconMegaphone.imageView?.image = UIImage(named: "icon_megaphone")?.withRenderingMode(.alwaysTemplate)
        iconMegaphone.imageView?.tintColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Tilbage"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Registrering"
    }
    
}
