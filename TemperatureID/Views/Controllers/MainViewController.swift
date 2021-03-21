//
//  MainViewController.swift
//  TemperatureID
//
//  Created by dadDev on 3/20/21.
//

import UIKit

class MainViewController: UIViewController, UINavigationBarDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //outlets
    @IBOutlet weak var customUIView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    //varaibles
    
    let imagePicker = UIImagePickerController()
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            
            guard let convertCIImage = CIImage(image: userPickImage) else {
                fatalError("cannot conver image")
            }
            
            CameraViewModel.detect(image: convertCIImage, inputModel: Inceptionv3().model, navigationController: navigationController!, title: navigationItem)
            imageView.image = userPickImage
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        
        
        RoundedUIView.roundedView(customUIView)
        //imageView.image?.roundCorners(proportion: 20)
        RoundedUIView.roundedImage(imageView)
    }
    

    

}


//MARK: - Button

extension MainViewController {
   
    @IBAction func cameraButton(_ sender: UIBarItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
}
