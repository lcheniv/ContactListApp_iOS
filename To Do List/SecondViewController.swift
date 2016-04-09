//
//  SecondViewController.swift
//  To Do List
//
//  Created by Lawrence Chen on 1/27/16.
//  Copyright © 2016 Lawrence Chen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var itemField: UITextField!
    @IBOutlet var addressField: UITextField!
    @IBOutlet var cityField: UITextField!
    @IBOutlet var stateField: UITextField!
    @IBOutlet var zipField: UITextField!
    @IBOutlet var cellField: UITextField!
    @IBOutlet var homeField: UITextField!
    
    @IBAction func captureImage() {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .PhotoLibrary
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    @IBAction func takePicture() {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        imageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        // Adding the item put into the text field to the array
        toDoList.append(itemField.text!)
        
        
        // Clearing item.text so that the textfield will be empty and they can write another to do list item
        itemField.text = ""
        addressField.text = ""
        cityField.text = ""
        stateField.text = ""
        zipField.text = ""
        cellField.text = ""
        homeField.text = ""
        
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        itemField.resignFirstResponder()
        
        return true
        
    }


}

