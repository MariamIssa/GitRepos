//
//  ViewController.swift
//  GitRepos
//
//  Created by Mariam Issa on 4/16/18.
//  Copyright © 2018 Mariam Al Ethawy. All rights reserved.
//

import UIKit

struct GitHub {
    var name: String?
    var description: String?
    var created_at: String?
    var owner: String?
    var license: String?
}

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectioView: UICollectionView!
    
    let dataLayer: DataLayer = DataLayer()
    var isGridlayout: Bool = false
    let listLayout: ListLayout = ListLayout()
    let gridLayout: GridLayout = GridLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.dataLayer.setUp(completion: {
            DispatchQueue.main.async {
                self.collectioView.reloadData()
                
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataLayer.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell? = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        if cell == nil {
            cell = UICollectionViewCell(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        }
        
        var gitHub: GitHub = GitHub()
            
        gitHub  = self.dataLayer.itemForIndex(index: indexPath.row)
        
        let namel: UILabel = cell?.viewWithTag(1) as! UILabel
        namel.text = gitHub.name
        
        return cell!
    }
    
    @IBAction func segmentedControll(_ sender: Any) {
        
        let segment: UISegmentedControl = sender as! UISegmentedControl
        
        switch segment.selectedSegmentIndex {
        case 0:
            UIView.animate(withDuration: 0.2) { () -> Void in
                self.collectioView.collectionViewLayout.invalidateLayout()
                self.collectioView.setCollectionViewLayout(self.gridLayout, animated: true)
            }
            
            
        default:
            UIView.animate(withDuration: 0.2) { () -> Void in
                self.collectioView.collectionViewLayout.invalidateLayout()
                self.collectioView.setCollectionViewLayout(self.listLayout, animated: true)
            }
            
        }
        
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        self.collectioView.collectionViewLayout.invalidateLayout()
    }
}

