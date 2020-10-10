//
//  HotelViewController.swift
//  JabariBears
//
//  Created by George Martin on 10/9/20.
//

import UIKit

class HotelViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let hotel_data = [
        "Fort Worth": [
            [
                "name": "Comfort Suites North Fossil Creek",
                "county": "Tarrant",
                "address": "3751 Tanacross Dr, Fort Worth, TX 76137",
                "image": "https://lh3.googleusercontent.com/p/AF1QipMPhrlPYfa03l_qhScSSwUQQtNJALTXXRKaaxlN=w296-h202-n-k-rw-no-v1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "Staybridge Suites Fort Worth",
                "county": "Tarrant",
                "address": "6301 North Fwy, Fort Worth, TX 76131",
                "image": "https://lh3.googleusercontent.com/proxy/MHNBzyRgS81vdlS7wlYl13hPl0qm7IrWgyDV7maSd4bqB0gJLXaTNt0juMXP5eO08nRPTP_jA4jezB-0hfIF8mkFOSxKPwnSnzq_jFYiUGg6JWa__hbB42eOS0leISGimwDHrWqiTNSx810ZpI7tsks0eg4KsA=w296-h202-n-k-rw-no-v1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "Omni Fort Worth Hotel",
                "county": "Tarrant",
                "address": "1300 Houston St, Fort Worth, TX 76102",
                "image": "https://lh3.googleusercontent.com/p/AF1QipNIYufwKfCNnmODwxfjXrfFj1WyYq4RG5Wvpcxb=w296-h202-n-k-rw-no-v1",
                "stars": "4-star hotel"
                
            ],
        ],
        "Los Angeles": [
            [
                "name": "Omni Los Angeles Hotel",
                "county": "Los Angeles",
                "address": "251 S Olive St, Los Angeles, CA 90012",
                "image": "https://lh3.googleusercontent.com/p/AF1QipMAfq64Vi5P2KhQ6LGGYpB0M4YGwTwSeZSO6tEr=w296-h202-n-k-rw-no-v1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "Courtyard by Marriott Los Angeles Torrance/South Bay",
                "county": "Los Angeles",
                "address": "1925 W 190th St, Torrance, CA 90504",
                "image": "https://lh3.googleusercontent.com/p/AF1QipO0_q_ACWSP5_LAtKIYPKtbsLbIW8wVrOiHfF2b=w296-h202-n-k-rw-no-v1",
                "stars": "3-star hotel"
                
            ],
            [
                "name": "Embassy Suites by Hilton Arcadia Pasadena Area",
                "county": "Los Angeles",
                "address": "211 E Huntington Dr, Arcadia, CA 91006",
                "image": "https://lh3.googleusercontent.com/proxy/sejgy-eVcIZKfzGsgLVFZ1oj63fGYJGazEQ3MTE13bAl7F7YL24qycm7bQYY8dfb-GJ_nR6cXF5fYbQoatnLUrm-OPqDkAOxhUI6CyOeb1kHr8GlkSsKwBbEWizR3N_ttQrTlknLKJ2UL6VyRN3oRVUfo6IiKvM=w296-h202-n-k-rw-no-v1",
                "stars": "3-star hotel"
                
            ],
        ],
        "Baltimore": [
            [
                "name": "Hyatt Regency Baltimore Inner Harbor",
                "county": "Baltimore",
                "address": "300 Light St, Baltimore, MD 21202",
                "image": "https://lh3.googleusercontent.com/p/AF1QipN96wrcANLWZGRTJmz2Qa7eXE71QFsZNp7nwGL4=w296-h202-n-k-rw-no-v1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "La Quinta Inn & Suites",
                "county": "Baltimore",
                "address": "6323 Ritchie Hwy, Glen Burnie, MD 21061",
                "image": "https://lh3.googleusercontent.com/p/AF1QipNITV90ClkvoL311Ex8LFTSLvBSzy845oVFTcwq=w296-h202-n-k-rw-no-v1",
                "stars": "4-star hotel"
                
            ],
            [
                "name": "CloudHostels",
                "county": "Baltimore",
                "address": "2937 N Calvert St, Baltimore, MD 21218",
                "image": "https://lh3.googleusercontent.com/p/AF1QipP99zALpE4sGLYncf5LdOI3ny5CFW0XrND5WQ6T=w296-h202-n-k-rw-no-v1",
                "stars": "4-star hotel"
                
            ],
        ]
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath) as! HotelTableViewCell
        
//        cell.hotelName.text = hotel_data["Baltimore"]?[indexPath.row]["name"]
        
        return cell
    }
    

}
