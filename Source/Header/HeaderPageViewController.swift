//
//  HeaderPageViewController.swift
//  CalendarKit
//
//  Created by Kevin Ladan on 4/9/19.
//

import UIKit

public class HeaderPageViewController: UIPageViewController, UIScrollViewDelegate {
  public var scrollDelegate: UIScrollViewDelegate?
  
  public var isScrolling: Bool = false

  public override func viewDidLoad() {
    super.viewDidLoad()
    let scrollView = getScrollView()
    scrollView.delegate = self
  }
  
  public func getScrollView() -> UIScrollView {
    return view.subviews.filter { $0 is UIScrollView }.first as! UIScrollView
  }

  public func scrollViewDidScroll(_ sender: UIScrollView) {
    self.isScrolling = true
    
    NSObject.cancelPreviousPerformRequests(withTarget: self)
    // ensure that the end of scroll is fired.
    perform(#selector(UIScrollViewDelegate.scrollViewDidEndScrollingAnimation(_:)), with: sender, afterDelay: 0.2)
    
    self.scrollDelegate?.scrollViewDidScroll?(sender)
  }
  
  @objc public func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    NSObject.cancelPreviousPerformRequests(withTarget: self)
    
    self.isScrolling = false
  }
}
