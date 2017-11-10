//
//  FormViewController.swift
//  Demo
//
//  Created by gap on 2017/11/10.
//  Copyright © 2017年 gap. All rights reserved.
//

import UIKit
import XLForm

class FormViewController: XLFormViewController {
    override init!(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initializeForm()
    }
    
    required init!(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        initializeForm()
    }
    
    func initializeForm() {
        self.title = "Form Table"
        
        let form:XLFormDescriptor
        var section:XLFormSectionDescriptor
        var row:XLFormRowDescriptor
        
        form = XLFormDescriptor()
        
        section = XLFormSectionDescriptor.formSection(withTitle: "First")
        form.addFormSection(section)
        
        let dataArray = [["Title":"First","Tag":"1","RowType":XLFormRowDescriptorTypeText],
                         ["Title":"Second","Tag":"2","RowType":XLFormRowDescriptorTypeInfo],
                         ["Title":"Three","Tag":"3","RowType":XLFormRowDescriptorTypeEmail],
                         ["Title":"Fourth","Tag":"4","RowType":XLFormRowDescriptorTypeText]]

        for index in 0...dataArray.count - 1 {
            row = XLFormRowDescriptor(tag:dataArray[index]["Tag"],rowType:XLFormRowDescriptorTypeText,title:dataArray[index]["Title"])
            section.addFormRow(row)
        }
        
        
        self.form = form
    }
    
}
