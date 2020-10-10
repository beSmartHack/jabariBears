//
//  CityViewController.swift
//  JabariBears
//
//  Created by George Martin on 10/9/20.
//

import UIKit

class CityViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityDescription: UILabel!
    @IBAction func goToActivites(_ sender: Any) {
    }
    @IBAction func goToHotels(_ sender: Any) {
    }
    @IBAction func goToFlights(_ sender: Any) {
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
