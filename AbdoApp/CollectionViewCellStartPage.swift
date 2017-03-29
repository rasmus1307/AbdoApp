import UIKit

protocol CollectionViewCellStartPageDelegate {
    func collectionViewCellStartPageClicked(forCell: CollectionViewCellStartPage)
}

class CollectionViewCellStartPage: UICollectionViewCell {
    
    var cellImage = UIImageView()
    var cellLabel = UILabel()
    var cellTextView = UITextView()
    var cellImageLeft = UIImageView()
    var cellButton = UIButton()
    var delegate: CollectionViewCellStartPageDelegate? = nil
    
    override func awakeFromNib() {
        
        let imageSize = CGSize(width: contentView.frame.height/6, height: contentView.frame.height/6)
        let imagePoint = CGPoint(x: 16, y: contentView.frame.height/2 - imageSize.height/2)
        cellImage = UIImageView(frame: CGRect(origin: imagePoint, size: imageSize))
        cellImage.contentMode = .scaleAspectFit
        cellImage.tintColor = .white
        contentView.addSubview(cellImage)
        
        let imageSizeLeft = CGSize(width: contentView.frame.height/6, height: contentView.frame.height/6)
        let imagePointLeft = CGPoint(x: contentView.frame.width - 16 - imageSizeLeft.width, y: contentView.frame.height/2 - imageSizeLeft.height/2)
        cellImageLeft = UIImageView(frame: CGRect(origin: imagePointLeft, size: imageSizeLeft))
        cellImageLeft.contentMode = .scaleAspectFit
        cellImageLeft.image = UIImage(named: "icon_right_arrow")?.withRenderingMode(.alwaysTemplate)
        cellImageLeft.tintColor = .white
        contentView.addSubview(cellImageLeft)
        
        let innerViewSize = CGSize(width: contentView.frame.width/1.5, height: contentView.frame.height)
        let innerViewPoint = CGPoint(x: imagePoint.x + imageSize.width + 16, y: 0)
        let innerView = UIView(frame: CGRect(origin: innerViewPoint, size: innerViewSize))
        contentView.addSubview(innerView)
        
        let labelSize = CGSize(width: innerView.frame.width, height: 30)
        let labelPoint = CGPoint(x: 4, y: innerView.frame.height/2 - 12 - labelSize.height)
        cellLabel = UILabel(frame: CGRect(origin: labelPoint, size: labelSize))
        cellLabel.textAlignment = .left
        cellLabel.textColor = .white
        cellLabel.font = cellLabel.font.withSize(28)
        cellLabel.adjustsFontSizeToFitWidth = true
        innerView.addSubview(cellLabel)
        
        let textViewSize = CGSize(width: innerView.frame.width, height: innerView.frame.height/2)
        let textViewPoint = CGPoint(x: 0, y: (innerView.frame.height/2) - 12 - 4)
        cellTextView = UITextView(frame: CGRect(origin: textViewPoint, size: textViewSize))
        cellTextView.backgroundColor = UIColor.clear
        cellTextView.textColor = .white
        cellTextView.font = cellLabel.font.withSize(14)
        innerView.addSubview(cellTextView)
        
        let buttonPoint = CGPoint(x: 0, y: 0)
        let buttonSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)
        cellButton = UIButton(frame: CGRect(origin: buttonPoint, size: buttonSize))
        cellButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        contentView.addSubview(cellButton)
    }
    
    func buttonClicked() {
        
        print("Clicked \(cellLabel.text!)")
        delegate?.collectionViewCellStartPageClicked(forCell: self)
    }

    
}
