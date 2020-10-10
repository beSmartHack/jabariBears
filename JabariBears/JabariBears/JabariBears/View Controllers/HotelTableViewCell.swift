//
//  HotelTableViewCell.swift
//  JabariBears
//
//  Created by George Martin on 10/9/20.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    
    @IBOutlet weak var hotelName: UILabel!

    @IBOutlet weak var numberOfCases: UILabel!
    @IBOutlet weak var hotelAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
