

import UIKit

class ItemCell: UITableViewCell {
  
  @IBOutlet weak var imgIcon: UIImageView!
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var lblLocation: UILabel!
  
  var item: Item? = nil {
    didSet {
      if let item = item {
        imgIcon.image = Icons(rawValue: item.icon)?.image()
        lblName.text = item.name
        
      } else {
        imgIcon.image = nil
        lblName.text = ""
        lblLocation.text = ""
      }
    }
  }
  
  func refreshLocation() {
  }
}
