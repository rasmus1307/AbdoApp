import UIKit

class ViewControllerPain: UIViewController {
    
    @IBOutlet weak var theView: UIView!
    var collectionView: UICollectionView!
    
    var images = [UIImage(named: "painLevel01"), UIImage(named: "painLevel02"), UIImage(named: "painLevel03"), UIImage(named: "painLevel04"), UIImage(named: "painLevel05")]
    var labels = ["Kun en lille smule", "Lidt ondt", "Ret ondt", "Ret meget ondt", "Rigtig meget ondt"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = false
        setupCollectionView()
        automaticallyAdjustsScrollViewInsets = false
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(CollectionViewCellRating.self, forCellWithReuseIdentifier: "collectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .gray
        theView.addSubview(collectionView)
    }
    
}



extension ViewControllerPain: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCellRating
        cell.awakeFromNib()
        cell.delegate = self
        return cell
    }
    
    // Used to populate data to the given cell
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let collectionCell = cell as! CollectionViewCellRating
        collectionCell.cellImage.image = images[indexPath.row]
        collectionCell.cellLabel.text = labels[indexPath.row]
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

extension ViewControllerPain: CollectionViewCellDelegate {
    func collectionViewCellClicked(forCell: CollectionViewCellRating) {
        print("Cell clicked \(forCell.cellLabel.text!)")
        changeView(sender: forCell.cellButton)
    }
    
    func changeView(sender: UIButton)
    {
        print("Showing view Others")
        //performSegue(withIdentifier: "showOthers", sender: sender)
    }
}
