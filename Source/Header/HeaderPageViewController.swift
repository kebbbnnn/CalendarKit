//
//  HeaderPageViewController.swift
//  CalendarKit
//
//  Created by Kevin Ladan on 4/9/19.
//

import UIKit

public class HeaderPageViewController: UIPageViewController, UIScrollViewDelegate {
  
  public var scrollDelegate: UIScrollViewDelegate?
  
  public override func viewDidLoad() {
    super.viewDidLoad()

    for subview in view.subviews {
      if let scrollView = subview as? UIScrollView {
        scrollView.delegate = self
      }
    }
  }

  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if let scrollDelegate = self.scrollDelegate {
      scrollDelegate.scrollViewDidScroll?(scrollView)
    }
  }
}
