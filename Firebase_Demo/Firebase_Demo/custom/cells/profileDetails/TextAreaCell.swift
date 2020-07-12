//
//  txtAreaCell.swift
//  Firebase_Demo
//
//  Created by TRT-IOS-03 on 12/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

struct TextArea {
    var text: String
}

class TextAreaCell: UITableViewCell {
  @IBOutlet weak var descriptionArea: UITextView!
    
    var textArea = TextArea(text: "\n\n detail description")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        descriptionArea.text = "Placeholder"
        descriptionArea.textColor = UIColor.lightGray
        descriptionArea.delegate = self
        descriptionArea.layer.borderWidth = 1
        descriptionArea.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String, value: String?) {
//        self.textArea.text = title
        self.descriptionArea.text = value ?? ""
    }
}

extension TextAreaCell: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionArea.textColor == UIColor.lightGray {
            descriptionArea.text = nil
            descriptionArea.textColor = UIColor.black
        }
        descriptionArea.text = ""
        descriptionArea.text = textView.text
    }
}
