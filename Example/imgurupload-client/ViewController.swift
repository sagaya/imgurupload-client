//
//  ViewController.swift
//  imgurupload-client
//
//  Created by cosmo1234 on 04/01/2017.
//  Copyright (c) 2017 cosmo1234. All rights reserved.
//

import UIKit
import imgurupload_client

class ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imagePicker:UIImagePickerController!

    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("Select Image", for: .normal)
        btn.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let button2: UIButton = {
        let btn = UIButton()
        btn.setTitle("Upload Image", for: .normal)
        btn.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    let selectedImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .black
        return img
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.selectedImage.image = image
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //LAYOUT STUFF
    override func viewDidLayoutSubviews() {
        view.addSubview(button)
        view.addSubview(selectedImage)
        view.addSubview(button2)
        if #available(iOS 9.0, *) {
            NSLayoutConstraint.activate([
                
                selectedImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                selectedImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                selectedImage.heightAnchor.constraint(equalToConstant: 100),
                selectedImage.widthAnchor.constraint(equalToConstant: 100),
                
                button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 20),
                button2.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
                button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button2.widthAnchor.constraint(equalToConstant: 200),
                button2.heightAnchor.constraint(equalToConstant: 20),
                ])
        } else {
            // Fallback on earlier versions
        }
    }
    
    func selectImage(){
        present(imagePicker, animated: true, completion: nil)
    }
    func uploadImage(){
        let imageData = UIImagePNGRepresentation(selectedImage.image!)
        ImgurUpload.upload(imageData: imageData!, apiKey: "aab3505f42b5d63", completionHandler: { (response) in
            //USE THE RESPONSE OBJECT
            print(response)
        })
    }
}

