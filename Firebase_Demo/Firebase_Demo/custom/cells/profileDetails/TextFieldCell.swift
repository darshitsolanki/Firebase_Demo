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

class TextFieldCell: UITableViewCell {
@IBOutlet weak var txtField: UITextField!
    
    var textField = textFieldStruct(text: "")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        txtField.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(title: String, value: String?) {
//        self.txtField.placeholder = title
        self.textField.text = title ?? ""
    }
}

extension TextFieldCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        txtField.text = textField.text
    }
}
