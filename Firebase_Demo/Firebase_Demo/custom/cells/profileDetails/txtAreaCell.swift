//
//  txtAreaCell.swift
//  Firebase_Demo
//
//  Created by TRT-IOS-03 on 12/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

struct txtArea {
    var text: String
}

class txtAreaCell: UITableViewCell {
  @IBOutlet weak var descriptionArea: UITextView!
    
    var textArea = txtArea(text: "asdf")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        descriptionArea.layer.borderWidth = 1
        descriptionArea.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setText(text : String) {
        self.descriptionArea.text = text
    }
}

extension txtAreaCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        descriptionArea.text = ""
        descriptionArea.text = textView.text
    }
}
