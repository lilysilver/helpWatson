//
//  HospitalTableView.swift
//  Help Watson
//
//  Created by Sonera Tayub on 25/05/2018.
//  Copyright © 2018 helpWatson. All rights reserved.
//

import Foundation
import UIKit

class HospitalTableView: UITableView {
    
        //MARK: Properties
        

    
        
        //MARK: - Table view data source
        

    
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         //MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
 */
        
        //MARK: Private Methods
        
        
        @objc private func getHospitalsData(){
            
//            let urlString = "https://anthony-blockchain.us-south.containers.mybluemix.net/leaderboard/top/50"
//            guard let url = URL(string: urlString) else {
//                print("url error")
//                return
//            }
//
//            URLSession.shared.dataTask(with: url) { (data, response, error) in
//                if error != nil {
//                    print(error!.localizedDescription)
//                    print("No internet")
//
//                    // use booklet.json if no internet
//                }
//
//                guard let data = data else { return }
//
//                do {
//                    //Decode retrived data with JSONDecoder and assing type of Article object
//                    self.hospitals = try JSONDecoder().decode([Hospital].self, from: data)
//
//                    DispatchQueue.main.async {
//                        self.tableView.reloadData()
//                        self.refreshControl?.endRefreshing()
//                        //                            self.refreshControl?.endRefreshing()
//                        //                            self.activityIndicatorView.stopAnimating()
//                    }
//
//                } catch let jsonError {
//                    print(jsonError)
//                }
//                }.resume()
            
            
        }
        
        
        func base64ToImage(base64: String) -> UIImage {
            var img: UIImage = UIImage()
            if (!base64.isEmpty) {
                let decodedData = NSData(base64Encoded: base64 , options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
                let decodedimage = UIImage(data: decodedData! as Data)
                img = (decodedimage as UIImage?)!
            }
            return img
        }
 }
