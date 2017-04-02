import UIKit

class ViewControllerStartpage: UIViewController {

    @IBOutlet weak var theView: UIView!
    var collectionView: UICollectionView!

    var images = [UIImage(named: "add_user_icon")?.withRenderingMode(.alwaysTemplate), UIImage(named: "icon_sharecode")?.withRenderingMode(.alwaysTemplate), UIImage(named: "icon_email")?.withRenderingMode(.alwaysTemplate)]
    var labels = ["Registrer barn", "Indtast delekode", "Gendan fra email"]
    var info = ["Er dit barn ikke registreret i abdo endnu, kan du gøre det her", "Har du en delekode fra et registreret barn, som du skal have adgang til, kan du indtaste den her", "Har du tidligere benyttet abdo, og har haft tilknyttet en email til din konto, kan du gendanne din bruger her" ]
    var linkTo = ["showRegistration", "showSharecode", "showRestoreFromEmail"]
    var colors = [ColorScheme().masterData, ColorScheme().shareCode, ColorScheme().restoreFromMail]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = false
        setupCollectionView()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = "Fortryd"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "Abdo"
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(CollectionViewCellStartPage.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = ColorScheme().backgroundColor
        theView.addSubview(collectionView)
    }

}

extension ViewControllerStartpage: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Specifying the number of sections in the collectionView
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Specifying the number of rows in the given section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    // Used to deque the cell and set it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCellStartPage
        cell.awakeFromNib()
        cell.delegate = self
        return cell
    }
    
    // Used to populate data to the given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let collectionCell = cell as! CollectionViewCellStartPage
        collectionCell.cellImage.image = images[indexPath.row]
        collectionCell.cellLabel.text = labels[indexPath.row]
        collectionCell.cellTextView.text = info[indexPath.row]
        collectionCell.contentView.backgroundColor = colors[indexPath.row]
        collectionCell.cellButton.accessibilityLabel = linkTo[indexPath.row]
        collectionCell.cellImage.tintColor = .white
    }
    
    // Sets the size for the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var elementSize : CGSize {
            let size = theView.frame.height / CGFloat(images.count)
            return CGSize(width: theView.frame.width, height: size)
        }
        return elementSize
    }
}

extension ViewControllerStartpage: CollectionViewCellStartPageDelegate {
    func collectionViewCellStartPageClicked(forCell: CollectionViewCellStartPage) {
        print("Cell clicked \(forCell.cellLabel.text!)")
        changeView(sender: forCell.cellButton)
    }
    
    func changeView(sender: UIButton)
    {
        print("Showing view \(sender.accessibilityLabel!)")
        performSegue(withIdentifier: "\(sender.accessibilityLabel!)", sender: sender)
    }
}
