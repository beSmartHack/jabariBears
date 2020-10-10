//
//  HotelViewController.swift
//  JabariBears
//
//  Created by George Martin on 10/9/20.
//

import UIKit

class HotelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var cityName = String()

    @IBOutlet weak var hotelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath) as! HotelTableViewCell
        return cell
    }
    

}
