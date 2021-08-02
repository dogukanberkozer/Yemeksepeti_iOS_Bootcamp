//
//  ViewController.swift
//  PageControl
//
//  Created by Dogukan Berk Ozer on 10.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemBlue
        return pageControl
    }()
    
    private let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        view.addSubview(pageControl)
        view.addSubview(scrollView)
        scrollView.backgroundColor = .red
    }
    
    @objc func pageControlChanged(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: current * Int(view.frame.size.width), y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - 50, width: view.frame.size.width, height: 50)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [
            .red,
            .systemPurple,
            .systemGray,
            .systemGreen,
            .systemYellow
        ]
        for x in 0..<5 {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            page.backgroundColor = colors[x]
            scrollView.addSubview(page)
        }
    }

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewScrolled(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(Float(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}

