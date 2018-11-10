//
//  EmbeddedCropViewController.swift
//  MantisExample
//
//  Created by Echo on 11/9/18.
//  Copyright © 2018 Echo. All rights reserved.
//

import UIKit

class EmbeddedCropViewController: UIViewController {

    var image: UIImage?
    var cropViewController: CropViewController?
            
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func crop(_ sender: Any) {
        cropViewController?.crop()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CropViewController {
            vc.image = image
            vc.mode = .customizable
            vc.delegate = self
            cropViewController = vc
            Mantis().config.addCustomRatio(byWidth: 2, andHeight: 1)
        }
    }
}

extension EmbeddedCropViewController: CropViewControllerProtocal {
    func didGetCroppedImage(image: UIImage) {
        print("get the cropped image.")
    }
}
