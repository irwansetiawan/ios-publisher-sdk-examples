//
//  ViewController.swift
//  SwiftTest
//
//  Created by Irwan Setiawan on 29/10/20.
//

import UIKit
import CriteoPublisherSdk

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func testLoadBidWithNilCheck() {

    let adUnit = CRBannerAdUnit.init(adUnitId: "", size: CGSize(width: 320, height: 50))

    Criteo.shared().loadBid(for: adUnit) { maybeBid in
        // Called when a response is received, or timed out.
        // Run your auction here
        var criteoBid : NSMutableDictionary = [:]

        if let bid = maybeBid {
            // add Criteo bids into Ad Manager request
            Criteo.shared().enrichAdObject(criteoBid, with: bid)

            let price = bid.price
        }

    }
  }


}

