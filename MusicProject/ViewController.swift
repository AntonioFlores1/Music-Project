//
//  ViewController.swift
//  MusicProject
//
//  Created by C4Q on 11/19/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showTableView: UITableView!
    
     var songData = Song.allSongs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTableView.delegate = self
        showTableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
            case "singleSong":
            guard let destination = segue.destination as? PlayerViewController,
            let cellSelected = showTableView.indexPathForSelectedRow else {return}
            let songSelected = songData[cellSelected.row]
            destination.song = songSelected
            
            default:
                return
            
        }
    
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = showTableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? ShowCell else { return UITableViewCell() }
        let songToSet = songData[indexPath.row]
         cell.songImage.image = songToSet.image
         cell.songArtist.text = songToSet.artist
         cell.songTitle.text = songToSet.name
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    }
    

