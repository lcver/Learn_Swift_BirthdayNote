//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Yapindo on 28/01/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var carsName = [String]()
    var carsImage = [UIImage]()
    var choseCarName = ""
    var choseCarImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        // Name
        carsName.append("gtr-pandem")
        carsName.append("gtr-libertywalk")
        carsName.append("chevrolet")
        carsName.append("mazda-rx7-red")
        
        // Images
        carsImage.append(UIImage(named: "gtr-pandem")!)
        carsImage.append(UIImage(named: "gtr-libertywalk")!)
        carsImage.append(UIImage(named: "chevrolet")!)
        carsImage.append(UIImage(named: "mazda-rx7-red")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carsName.remove(at: indexPath.row)
            carsImage.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left )
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(carsName[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carsName.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        choseCarName = carsName[indexPath.row]
        choseCarImage = carsImage[indexPath.row]

        performSegue(withIdentifier: "toImageVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageVC" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedCarName = choseCarName
            destinationVC.selectedCarImage = choseCarImage
        }
    }

}

