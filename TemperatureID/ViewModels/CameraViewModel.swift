//
//  CameraViewModel.swift
//  TemperatureID
//
//  Created by dadDev on 3/20/21.
//

import Foundation
import UIKit
import Vision
import CoreML

class CameraViewModel {
    
    static func detect(image: CIImage, inputModel: MLModel, navigationController: UINavigationController, title: UINavigationItem) {
        guard let model = try? VNCoreMLModel(for: inputModel) else {
            fatalError("cannot import model")
        }
        
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let classification = request.results?.first as? VNClassificationObservation else {
                fatalError("could not class")
            }
            title.title = classification.identifier.capitalized
            print("GOKU: \(classification.identifier.capitalized)")
            if request.results != nil {
                navigationController.navigationBar.barTintColor = UIColor.green
                //navigationController.title = classification.identifier.capitalized
            }
        } // end of closure
        
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
        
    } // end of detect func
    
} // end of class
