//
//  textView.swift
//  PinBy
//
//  Created by Jaypreet on 03/07/20.
//  Copyright © 2020 Jaipreet. All rights reserved.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift


class Text: UIView {
    @IBInspectable var border : CGColor = CGColor.init(srgbRed: 192/255, green: 204/255, blue: 218/255, alpha: 1){
        didSet {
            Setup()
        }
    }
    @IBInspectable var selectedborder : CGColor = CGColor.init(srgbRed: 0/255, green: 93/255, blue: 242/255, alpha: 1){
        didSet {
            Setup()
        }
    }
//    @IBInspectable var textFieldBgColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1){
//        didSet {
//            Setup()
//        }
//    }
    @IBInspectable var isDropDown : Bool = false{
        didSet {
            Setup()
        }
    }
    @IBInspectable var isEmail : Bool = false{
        didSet {
            Setup()
        }
    }
    @IBInspectable var font : UIFont = UIFont.systemFont(ofSize: 17){
        didSet {
            Setup()
        }
    }

    @IBInspectable var secureTextKey : Bool = false{
        didSet {
            Setup()
        }
    }
    @IBInspectable var textPlaceholder : String = ""{
        didSet {
            Setup()
        }
    }
    
    var t : UITextField!
    var placeholderLable : UILabel!
    var innerView : UIView!
    var btnScure : UIButton!

    required init(coder aDecoder: (NSCoder?)) {
          super.init(coder: aDecoder!)!
        Setup()
    }
    
    func Setup()  {
         

        backgroundColor = UIColor.clear
        innerView = UIView.init(frame: CGRect.init(x: 0, y: 10, width: frame.size.width , height: frame.size.height - 12))
        addSubview(innerView)
        
        t = UITextField.init(frame: CGRect.init(x: 8, y: 8, width: innerView.frame.size.width - 30, height: innerView.frame.size.height - 16))
        t.placeholder = textPlaceholder
        t.borderStyle = .none
        placeholderLable = UILabel.init(frame: CGRect.init(x: 20, y: 2, width: textPlaceholder.width(withConstrainedHeight: 16, font: font) + 4, height: 16))
        placeholderLable.font = font
        
        addSubview(placeholderLable)
        placeholderLable.textAlignment = .center
        placeholderLable.backgroundColor = UIColor.white
       
        innerView.addSubview(t)
        placeholderLable.isHidden = true

        t.textColor = UIColor.black
        t.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        t.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidBegin)
        t.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidEnd)

        
        btnScure = UIButton.init(frame: CGRect.init(x: frame.size.width - 30, y: frame.size.height/2 - 10, width: 20, height: 20))

        btnScure.addTarget(self, action: #selector(eyePassword(_:)), for: .touchDown)
        btnScure.setImage(#imageLiteral(resourceName: "ic_hide_eye.png"), for: .normal)

        innerView.addSubview(btnScure)
        innerView.layer.borderColor = (border )
        innerView.layer.cornerRadius = 4
        innerView.layer.borderWidth = 1
        t.isSecureTextEntry = secureTextKey
               
        if isEmail{
            t.keyboardType = .emailAddress
        }
        if secureTextKey{
            btnScure.isHidden = false
        }
        else{
            btnScure.isHidden = true
        }
        if isDropDown{
            btnScure.isHidden = false
            btnScure.setImage(#imageLiteral(resourceName: "activity"), for: .normal)
            btnScure.isUserInteractionEnabled = false
        }
        t.placeholder = textPlaceholder
    }
    func UpdateFrame()  {
        innerView.frame = CGRect.init(x: 0, y: 10, width: frame.size.width , height: frame.size.height - 12)
        t.frame =  CGRect.init(x: 8, y: 0, width: innerView.frame.size.width - 12, height: innerView.frame.size.height - 2)
        placeholderLable.frame =  CGRect.init(x: 15, y: 2, width: textPlaceholder.width(withConstrainedHeight: 16, font: font) + 8, height: 16)
        btnScure.frame =  CGRect.init(x: frame.size.width - 30, y: t.frame.size.height/2 - 10, width: 20, height: 20)
    }

   
    @objc func textFieldDidChange(_ textField: UITextField) {
        SetPosition()
    }
    func SetPosition()  {
       
        if t.text == ""{
            placeholderLable.isHidden = true
            placeholderLable.text = t.placeholder
            innerView.layer.borderColor = (border )
        }
        else{
            placeholderLable.isHidden = false
            placeholderLable.text = t.placeholder
            innerView.layer.borderColor = (selectedborder )
        }
    }
    @IBAction func eyePassword(_ sender: UIButton) {
        if isDropDown{
                   return
               }
          if btnScure.image(for: .normal) == #imageLiteral(resourceName: "ic_eye"){
                   t.isSecureTextEntry = false
                   btnScure.setImage(#imageLiteral(resourceName: "ic_hide_eye"), for: .normal)
               }
               else{
                   t.isSecureTextEntry = true
                    btnScure.setImage(#imageLiteral(resourceName: "ic_eye"), for: .normal)
               }
      }
    
    
}
class TextView: UIView , UITextViewDelegate {
    @IBInspectable var border : CGColor = CGColor.init(srgbRed: 192/255, green: 204/255, blue: 218/255, alpha: 1){
        didSet {
            Setup()
        }
    }
    @IBInspectable var selectedborder : CGColor = CGColor.init(srgbRed: 0/255, green: 93/255, blue: 242/255, alpha: 1){
        didSet {
            Setup()
        }
    }
    @IBInspectable var textFieldBgColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1){
        didSet {
//            updateColor()
        }
    }
    @IBInspectable var font : UIFont = UIFont.systemFont(ofSize: 17){
         didSet {
             Setup()
         }
     }

    

 
    @IBInspectable var textPlaceholder : String = ""{
        didSet {
            settextfield()
            UpdateFrame()
        }
    }
    @IBInspectable var textTitle : String = ""{
        didSet {
            settextfield()
            UpdateFrame()
        }
    }
    
    var t : IQTextView!
    var placeholderLable : UILabel!
    var innerView : UIView!

    required init(coder aDecoder: (NSCoder?)) {
          super.init(coder: aDecoder!)!
        Setup()
    }
    func Setup()  {
         

        backgroundColor = UIColor.clear
        innerView = UIView.init(frame: CGRect.init(x: 0, y: 10, width: frame.size.width - 4, height: frame.size.height - 12))
        addSubview(innerView)
        
        t = IQTextView.init(frame: CGRect.init(x: 8, y: 8, width: innerView.frame.size.width - 30, height: innerView.frame.size.height - 16))
        t.placeholder = textPlaceholder
        placeholderLable = UILabel.init(frame: CGRect.init(x: 20, y: 2, width: textPlaceholder.width(withConstrainedHeight: 16, font: font) + 4, height: 16))
        placeholderLable.font = font
        addSubview(placeholderLable)
        placeholderLable.textAlignment = .center
        placeholderLable.backgroundColor = UIColor.white
       
        innerView.addSubview(t)
        placeholderLable.isHidden = true

        t.font = font
        t.textColor = UIColor.black
        t.delegate = self
        
        
        innerView.layer.borderColor = (border )
        innerView.layer.cornerRadius = 4
        innerView.layer.borderWidth = 1
        innerView.backgroundColor = textFieldBgColor

        
    }
    func UpdateFrame()  {
        innerView.frame = CGRect.init(x: 0, y: 10, width: frame.size.width , height: frame.size.height - 12)
        t.frame =  CGRect.init(x: 8, y: 0, width: innerView.frame.size.width - 12, height: innerView.frame.size.height - 2)
        placeholderLable.frame =  CGRect.init(x: 15, y: 2, width: textTitle.width(withConstrainedHeight: 16, font: font) + 8, height: 16)


    }
  
    func settextfield() {
        t.placeholder = textPlaceholder
     }
    func textViewDidChange(_ textView: UITextView) {
        SetPosition()
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        return true
    }
   
    func SetPosition()  {
       
        if t.text == ""{
            placeholderLable.isHidden = true
            placeholderLable.text = textTitle
            innerView.layer.borderColor = (border )
        }
        else{
            placeholderLable.isHidden = false
            placeholderLable.text = textTitle
            innerView.layer.borderColor = (selectedborder )
        }
    }

    
    
}

extension String{
    func ShowPrice(price : Double) -> String {
        return self + String(format :"%.2f",price)
    }
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
    

}
