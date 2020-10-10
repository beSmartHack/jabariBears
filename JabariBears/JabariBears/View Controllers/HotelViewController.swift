//
//  HotelViewController.swift
//  JabariBears
//
//  Created by George Martin on 10/9/20.
//

import UIKit

class HotelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    var cityName = String()
    
    let hotel_data = [
        "Fort Worth": [
            [
                "name": "Comfort Suites North Fossil Creek",
                "county": "Tarrant",
                "address": "3751 Tanacross Dr, Fort Worth, TX 76137",
                "image": "fortHotel1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "Staybridge Suites Fort Worth",
                "county": "Tarrant",
                "address": "6301 North Fwy, Fort Worth, TX 76131",
                "image": "fortHotel2",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "Omni Fort Worth Hotel",
                "county": "Tarrant",
                "address": "1300 Houston St, Fort Worth, TX 76102",
                "image": "fortHotel3",
                "stars": "4-star hotel"
                
            ],
        ],
        "Los Angeles": [
            [
                "name": "Omni Los Angeles Hotel",
                "county": "Los Angeles",
                "address": "251 S Olive St, Los Angeles, CA 90012",
                "image": "laHotel1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "Courtyard by Marriott Los Angeles Torrance/South Bay",
                "county": "Los Angeles",
                "address": "1925 W 190th St, Torrance, CA 90504",
                "image": "laHotel2",
                "stars": "3-star hotel"
                
            ],
            [
                "name": "Embassy Suites by Hilton Arcadia Pasadena Area",
                "county": "Los Angeles",
                "address": "211 E Huntington Dr, Arcadia, CA 91006",
                "image": "laHotel3",
                "stars": "3-star hotel"
                
            ],
        ],
        "Baltimore": [
            [
                "name": "Hyatt Regency Baltimore Inner Harbor",
                "county": "Baltimore",
                "address": "300 Light St, Baltimore, MD 21202",
                "image": "baltHotel1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "La Quinta Inn & Suites",
                "county": "Baltimore",
                "address": "6323 Ritchie Hwy, Glen Burnie, MD 21061",
                "image": "baltHotel12",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "CloudHostels",
                "county": "Baltimore",
                "address": "2937 N Calvert St, Baltimore, MD 21218",
                "image": "baltHotel3",
                "stars": "4-star hotel"
                
            ],
        ]
    ]
    
    var hotel: [[String:String]]!
    
    override func viewDidLoad(){
        hotel = hotel_data[cityName]
        
        self.tableView.delegate = self
        self.tableView.dataSource = self;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath) as! HotelTableViewCell
        
        cell.hotelName.text = hotel_data["Baltimore"]?[indexPath.row]["name"]
        cell.hotelAddress.text = hotel_data["Baltimore"]?[indexPath.row]["address"]
        cell.numberOfCases.text = hotel_data["Baltimore"]?[indexPath.row]["address"]
        let image = UIImage(named: (hotel_data["Baltimore"]?[indexPath.row]["image"])!)
        cell.hotelImage.image = image
        return cell
    }
    

}
