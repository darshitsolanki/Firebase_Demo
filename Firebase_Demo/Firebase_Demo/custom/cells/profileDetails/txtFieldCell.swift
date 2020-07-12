//
//  txtFieldCell.swift
//  Firebase_Demo
//
//  Created by TRT-IOS-03 on 12/07/20.
//  Copyright © 2020 Third Rock Techkno. All rights reserved.
//

import UIKit

struct textFieldStruct {
    var text: String
}

class txtFieldCell: UITableViewCell {
@IBOutlet weak var txtField: UITextField!
    
    var textField = textFieldStruct(text: "")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setText(text : String) {
        self.textField.text = text
    }
}

extension txtFieldCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtField.text = textField.text
    }
}
