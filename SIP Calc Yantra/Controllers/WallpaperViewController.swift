//
//  WallpaperViewController.swift
//  SIP Calc Yantra
//
//  Created by Dinesh Sharma on 01/04/23.
//

import UIKit
import WatchLayout

class WallpaperViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    private var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchMenuArray()
    }
    
    func fetchMenuArray(){
        
        let path = Bundle.main.path(forResource: "index", ofType: "json")
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path ?? ""), options: .mappedIfSafe)
            let jsonResult : [String : Any] = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as! [String : Any]
            if let menu = jsonResult["items"] as?  [[String : Any]] {
                
                //                    self.arrImages.append(contentsOf: menu)
                for i in 0...menu.count-1 {
                    let item = menu[i]
                    let str = item["file"] as! String//+ ".jpg"
                    self.items.append(str)
                    
                    
                    let layout = WatchLayout()
                    layout.itemSize = 180
                    layout.spacing = 0
                    layout.nextItemScale = 0.5
                    layout.minScale = 0.15
                    
                    self.collectionView.collectionViewLayout = layout
                    self.collectionView.dataSource = self
                    self.collectionView.delegate = self
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.collectionView.setContentOffset((self.collectionView.collectionViewLayout as! WatchLayout).centeredOffsetForItem(indexPath: IndexPath(item: 0, section: 0)), animated: true)
                    }
                    
                }
                
            }
        } catch let err {
            print(err)
        }
        
    }

}



extension WallpaperViewController: UICollectionViewDelegate,UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return items.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCollectionViewCell
            cell.imgView.image = UIImage(named: items[indexPath.item])!.imageResized(to: cell.imgView.frame.size)
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print("Indexpath",indexPath.row)
        let vc : WpDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "WpDetailVC") as! WpDetailViewController
        vc.img1 = UIImage(named: items[indexPath.item])!
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
