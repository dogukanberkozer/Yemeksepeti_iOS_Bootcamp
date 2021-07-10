//
//  PageViewController.swift
//  Week_3
//
//  Created by Dogukan Berk Ozer on 10.07.2021.
//

import UIKit

class PageViewController: UIViewController {
    
    var controllers = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let firstVC = UIViewController()
        firstVC.view.backgroundColor = .red
        controllers.append(firstVC)
        
        let secondVC = UIViewController()
        secondVC.view.backgroundColor = .blue
        controllers.append(secondVC)
        
        let thirdVC = UIViewController()
        thirdVC.view.backgroundColor = .green
        controllers.append(thirdVC)
        
        let fourthVC = UIViewController()
        fourthVC.view.backgroundColor = .yellow
        controllers.append(fourthVC)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.pagingVC()
    }
    
    func pagingVC() {
        guard let first = controllers.first else { return }
        let VC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        
        VC.delegate = self
        VC.dataSource = self
        VC.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        
        present(VC, animated: true, completion: nil)
        
        
    }

}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil }
        let previous = index - 1
        return controllers[previous]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else { return nil }
        let next = index + 1
        return controllers[next]
    }
    
    
}
