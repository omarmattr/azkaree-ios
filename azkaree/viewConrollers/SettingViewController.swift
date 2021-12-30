//
//  File.swift
//  azkaree
//
//  Created by Nor on 03/10/1400 AP.
//

import UIKit

class SettingViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        mySwitch.isOn =  UserDefaults.standard.bool(forKey: ConstantClass.IS_DARK)
	    }
    
    @IBOutlet weak var mySwitch:UISwitch!
    @IBAction func btnDark(_ sender:UISwitch){
        UserDefaults.standard.set(sender.isOn , forKey: ConstantClass.IS_DARK)
        UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.overrideUserInterfaceStyle = sender.isOn ? .dark : .light
        let name = sender.isOn ? "navbar-n" : "navbar"
        self.navigationController?.navigationBar.shadowImage = ConstantClass.resizeImage( image:UIImage(named:name)!,targetSize: CGSize(width: ConstantClass.SCREEN_WIDTH, height: 10))

	    }

    @IBAction func sliderButton(_ sender: AnyObject) {

        //get the Slider values from UserDefaults
        let defaultSliderValue = UserDefaults.standard.float(forKey: "sliderValue")

        //create the Alert message with extra return spaces
        let sliderAlert = UIAlertController(title: "عدد مرات ظهور الاشعارات", message: "\n\n\n\n\n\n", preferredStyle: .alert)

        //create a Slider and fit within the extra message spaces
        //add the Slider to a Subview of the sliderAlert
        let slider = UISlider(frame:CGRect(x: 10, y: 100, width: 250, height: 80))
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = defaultSliderValue
        slider.isContinuous = true
        slider.tintColor = UIColor.green
        sliderAlert.view.addSubview(slider)
        
        //OK button action
        let sliderAction = UIAlertAction(title: "OK", style: .default, handler: { (result : UIAlertAction) -> Void in
            UserDefaults.standard.set(slider.value, forKey: "sliderValue")
            })

        //Cancel button action
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)

        //Add buttons to sliderAlert
        sliderAlert.addAction(sliderAction)
//        sliderAlert.addAction(cancelAction)

        //present the sliderAlert message
        self.present(sliderAlert, animated: true, completion: nil)
    }

}

