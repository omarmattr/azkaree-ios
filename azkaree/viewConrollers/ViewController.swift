//
//  ViewController.swift
//  azkaree
//
//  Created by omarmattr on 23/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let splashData = [SplashItem(photo: UIImage(named: "splash-1")!, text: """
تطبيق أذكاري
يجعلك تعيش في تجربة إيمانية , و رؤيا نورانية
في روحانيات الأذكار
"""),
                              SplashItem(photo: UIImage(named: "splash-2")!, text: """
أذكاري هي حياتي
ردد أذكارك صباحا و مساءا , تذكر نعم ربك
عليك مع تطبيق أذكار
"""),
                              SplashItem(photo: UIImage(named: "splash-3")!, text: "")]
   
    @IBOutlet var contentView :UIView!
    @IBOutlet var contentNotificationView :UIView!
    @IBOutlet var startBtn :UIButton!
    var currentViewControllIndex = 0
    var customPV:CustomPageViewController!
    
    @IBAction func btnSkip(_ sender:UIButton){
        ConstantClass.moveToVC(storyboard :  self.storyboard ,viewC: ConstantClass.ID_MAIN_CONTROLLER)
        
        ConstantClass.USER_DEFAULTS
            .set(true, forKey: ConstantClass.FIRST_OPEN_KEY)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewControll()
        
        let vaule =  ConstantClass.USER_DEFAULTS.bool(forKey: ConstantClass.IS_DARK)
        UIApplication.shared.keyWindow?.overrideUserInterfaceStyle = vaule ? .dark : .light
        
        if ConstantClass.USER_DEFAULTS.bool(forKey: ConstantClass.FIRST_OPEN_KEY) {
            ConstantClass.moveToVC(storyboard :  self.storyboard ,viewC: ConstantClass.ID_MAIN_CONTROLLER)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    func configViewControll()  {
        guard let pageViewControll = storyboard?.instantiateViewController(withIdentifier: String(describing:  CustomPageViewController.self))as? CustomPageViewController else {
            return
        }
        customPV = pageViewControll
        pageViewControll.delegate = self
        pageViewControll.dataSource = self
        
        addChild(pageViewControll)
        pageViewControll.didMove(toParent: self)
        pageViewControll.view.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pageViewControll.view)
        let views :[String:Any] = ["pageView": pageViewControll.view!]
        let constH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[pageView]|", options: .alignAllCenterY, metrics: nil, views: views)
        view.addConstraints(constH)
        let constW = NSLayoutConstraint.constraints(withVisualFormat: "V:|[pageView]|", options: .alignAllCenterX, metrics: nil, views: views)
        view.addConstraints(constW)
        guard let startVC = detailVCAt(index: currentViewControllIndex) else {
            return
        }
        pageViewControll.setViewControllers([startVC], direction: .forward, animated: true, completion: nil)
        
    }
    
    func detailVCAt(index:Int) -> SplashDataViewController?{
        if index >= splashData.count {
            return nil
        }
        guard let PostDataVC = storyboard?.instantiateViewController(withIdentifier: String(describing:  SplashDataViewController.self))as? SplashDataViewController else {
            return nil
        }
        PostDataVC.index = index
        PostDataVC.data = splashData[index]
        return PostDataVC
    }
    
}

extension ViewController:UIPageViewControllerDelegate,UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let dataVC = viewController as? SplashDataViewController
        guard var index = dataVC?.index else {
            return nil
        }
        currentViewControllIndex = index
        
        contentNotificationView.isHidden = true
        startBtn.isHidden = true
        
        if index == 0 {
            return nil
        }
        index -= 1
        return detailVCAt(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let dataVC = viewController as? SplashDataViewController
        guard var index = dataVC?.index else {
            return nil
        }
        
        if index == splashData.count{
            return nil
        }
        index += 1
        currentViewControllIndex = index
        
        
        if index == 3{
            contentNotificationView.isHidden = false
            startBtn.isHidden = false
        }else{
            contentNotificationView.isHidden = true
            startBtn.isHidden = true
        }
        return detailVCAt(index: index)
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllIndex
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return splashData.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToHome"{
            let aaa = segue.destination as! UITabBarController
            aaa.navigationItem.hidesBackButton = true
            
        }
    }
}


struct SplashItem{
    let photo :UIImage
    let text :String
}



