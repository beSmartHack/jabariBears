//
//  CityViewController.swift
//  JabariBears
//
//  Created by George Martin on 10/9/20.
//

import UIKit

class CityViewController: UIViewController {
    
    var isSmart: Bool!
    var cityData: [String:String]!
    
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateView()
    }
    
    func populateView() {
        self.cityName.text = self.cityData["name"]!
        let image = UIImage(named: self.cityData["image"]!)
        self.cityImage.image = image
        self.cityDescription.text = self.cityData["description"]
    }
    
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
