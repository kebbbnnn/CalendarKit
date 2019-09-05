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

    let scrollView = getScrollView()
    scrollView?.delegate = scrollDelegate
  }

  public func getScrollView() -> UIScrollView? {
    var scrollView: UIScrollView?
    for subview in view.subviews {
      if let foundScrollView = subview as? UIScrollView {
        scrollView = foundScrollView
      }
    }
    return scrollView
  }

  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    if let scrollDelegate = self.scrollDelegate {
      scrollDelegate.scrollViewDidScroll?(scrollView)
    }
  }
}
