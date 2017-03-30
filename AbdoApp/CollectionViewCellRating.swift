import UIKit

protocol CollectionViewCellDelegate {
    func collectionViewCellClicked(forCell: CollectionViewCellRating)
}

class CollectionViewCellRating: UICollectionViewCell {
    
    var cellImage = UIImageView()
    var cellLabel = UILabel()
    var cellButton = UIButton()
    var delegate: CollectionViewCellDelegate? = nil
    
    override func awakeFromNib() {
        
        //contentView.layer.borderWidth = 1
        //contentView.layer.borderColor = UIColor.orange.cgColor
        contentView.layer.backgroundColor = UIColor.white.cgColor
        
        let imagePoint = CGPoint(x: 8, y: 0)
        let imageSize = CGSize(width: contentView.frame.width/4, height: contentView.frame.height)
        cellImage = UIImageView(frame: CGRect(origin: imagePoint, size: imageSize))
        cellImage.contentMode = .scaleAspectFit
        contentView.addSubview(cellImage)
        
        let labelPoint = CGPoint(x: imagePoint.x + imageSize.width + 8, y: 0)
        let labelSize = CGSize(width: contentView.frame.width/2, height: contentView.frame.height)
        cellLabel = UILabel(frame: CGRect(origin: labelPoint, size: labelSize))
        cellLabel.textAlignment = .center
        contentView.addSubview(cellLabel)

        
        let rightImageSize = CGSize(width: 32, height: 32)
        let rightImagePoint = CGPoint(x: contentView.frame.width - 50, y: (contentView.frame.height/2)-(rightImageSize.height/2))
        //let rightImagePoint = CGPoint(x: 10, y: 10)
        let rightImage = UIImageView(frame: CGRect(origin: rightImagePoint, size: rightImageSize))
        rightImage.image = UIImage(named: "icon_right_arrow")?.withRenderingMode(.alwaysTemplate)
        rightImage.tintColor = ColorScheme().orange
        //rightImage.contentMode = .scaleAspectFit
        contentView.addSubview(rightImage)
        
        let buttonPoint = CGPoint(x: 0, y: 0)
        let buttonSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)
        cellButton = UIButton(frame: CGRect(origin: buttonPoint, size: buttonSize))
        cellButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        contentView.addSubview(cellButton)
    }
    
    func buttonClicked() {
        
        print("Clicked \(cellLabel.text!)")
        delegate?.collectionViewCellClicked(forCell: self)
    }
    
}
