//
//  HomeVC.swift
//  Heya
//
//  Created by TrungNV on 10/7/19.
//  Copyright © 2019 TrungNV. All rights reserved.
//

import UIKit
import CenteredCollectionView

class HomeVC: BaseTabViewController {
    
    @IBOutlet weak var btnFind: UIButton!
    @IBOutlet weak var btnPost: UIButton!
    @IBOutlet weak var postCollectionView: UICollectionView!
    @IBOutlet weak var userCollectionView: UICollectionView!
    @IBOutlet weak var landMarksTableView: UITableView!
    @IBOutlet weak var userCollectionContainer: UIView!
    @IBOutlet weak var heightOfLandMarkTable: NSLayoutConstraint!
    
    let cellPercentWidth: CGFloat = 0.9
    let HEIGHT_CELL_LANDMARK: CGFloat = 320
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!
    
    // MARK: - Vars
    let lstPost = HomeVC.initPosts()
    let lstUser = HomeVC.initUsers()
    let lstLandMark = HomeVC.initLandMarks()
    
    // MARK: - Life circles
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    // MARK: - Init UI
    func initUI() {
        btnFind.setRadius()
        btnPost.setRadius()
        userCollectionContainer.setRadius()
        userCollectionView.setRadius()
        initTableView()
        initCollectionView()
    }
    
    func initTableView(){
        landMarksTableView.register(UINib(nibName: "LandMarkTableViewCell", bundle: nil), forCellReuseIdentifier: "LandMarkTableViewCell")
        landMarksTableView.delegate = self
        landMarksTableView.dataSource = self
        heightOfLandMarkTable.constant = CGFloat(lstLandMark.count) * HEIGHT_CELL_LANDMARK
    }
    
    func initCollectionView(){
       // Post CollectionView
        postCollectionView.register(UINib(nibName: "PostCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PostCollectionViewCell")
        centeredCollectionViewFlowLayout = postCollectionView.collectionViewLayout as? CenteredCollectionViewFlowLayout
        centeredCollectionViewFlowLayout.minimumLineSpacing = 10
        centeredCollectionViewFlowLayout.itemSize = CGSize(
            width: postCollectionView.frame.width * cellPercentWidth,
            height: postCollectionView.frame.height - 2.0
        )
        initLayoutForCollectionView(postCollectionView)
        
        // User CollectionView
        userCollectionView.register(UINib(nibName: "UserCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "UserCollectionViewCell")
        let userColelctionViewLayout: UICollectionViewFlowLayout = userCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        userColelctionViewLayout.itemSize = CGSize(width: 200, height: userCollectionView.frame.height - 2)
        userColelctionViewLayout.minimumLineSpacing = 15
         initLayoutForCollectionView(userCollectionView)
    }
    
    func initLayoutForCollectionView(_ collectionView: UICollectionView){
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    // MARK: - Actions
    
    @IBAction func findAction(_ sender: Any) {
    }
    
    @IBAction func postAction(_ sender: Any) {
        let loginVC = LoginVC(nibName: "LoginVC", bundle: nil)
        self.present(loginVC, animated: true, completion: nil)
    }
    
}

// MARK: - CollectionView delegates, datasources
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case postCollectionView:
            return lstPost.count
        case userCollectionView:
            return lstUser.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
               case postCollectionView:
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as? PostCollectionViewCell
                   cell?.configCell(lstPost[indexPath.row])
                   return cell!
            
               case userCollectionView:
                   let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as? UserCollectionViewCell
                   cell?.configCell(lstUser[indexPath.row])
                   return cell!
            
               default:
                   return UICollectionViewCell()
               }
    }
}

// MARK: - UITableview delegates, datasources
extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lstLandMark.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LandMarkTableViewCell", for: indexPath) as? LandMarkTableViewCell
        cell?.configCell(lstLandMark[indexPath.row])
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HEIGHT_CELL_LANDMARK
    }
}

extension HomeVC{
    static func initUsers() -> [UserBO]{
        return [UserBO(name: "Nguyễn Thuỳ Linh", age: "18", avatar: "img_avatar_1", info: "Đại học Thương mại"),
                UserBO(name: "Trần Thuỳ Dung", age: "20", avatar: "img_avatar_2", info: "Công ty TTC Solutions"),
                UserBO(name: "Lưu Diệu Trâm", age: "18", avatar: "img_avatar_3", info: "Giáo viên tiếng anh"),
                UserBO(name: "Nguyễn Duyên Hạ", age: "28", avatar: "img_avatar_4", info: "Sinh viên"),
                UserBO(name: "Hồ Thị Như Thảo", age: "18", avatar: "img_avatar_2", info: "Đại học Bôn Ba")]
    }
    
    static func initLandMarks() -> [LandMarkBO]{
        return [LandMarkBO(name: "Chùa Bái Đính", location: "Ninh Bình, Việt Nam", image: "img_chua_bai_dinh", hastag: "chuabaidinh", typeLand: .A),
                LandMarkBO(name: "Chùa Một Cột", location: "Hà Nội, Việt Nam", image: "img_chua_mot_cot", hastag: "chuamotcot", typeLand: .B),
                LandMarkBO(name: "Động Phong Nha", location: "Quảng Bình, Việt Nam", image: "img_dong_phong_nha", hastag: "dongphongnha", typeLand: .A),
                LandMarkBO(name: "Hồ Gươm", location: "Hà Nội, Việt Nam", image: "img_ho_guom", hastag: "hoguom", typeLand: .C),
                LandMarkBO(name: "Lăng Bác Hồ", location: "Hà Nội, Việt Nam", image: "img_lang_bac", hastag: "langbac", typeLand: .B),
                LandMarkBO(name: "Vịnh Hạ Long", location: "Quảng Ninh, Việt Nam", image: "img_vinh_ha_long", hastag: "vinhhalong", typeLand: .A)]
    }
    
    static func initPosts() -> [PostBO]{
        let users = HomeVC.initUsers()
        let landmarks = HomeVC.initLandMarks()
        
        return [PostBO(name: "Có ai đi chơi không nào?", time: "10:00 AM - 20/10/2019", user: users[0], landmark: landmarks[0]),
                PostBO(name: "Tìm người hướng dẫn", time: "3:00 PM - 20/10/2019", user: users[1], landmark: landmarks[1]),
                PostBO(name: "Động Phong Nha", time: "10:00 AM - 20/10/2019", user: users[2], landmark: landmarks[2]),
                PostBO(name: "Vi vu Hồ Gươm ăn kem nào.", time: "10:00 AM - 20/10/2019", user: users[3], landmark: landmarks[3]),
                PostBO(name: "Đi chơi Lăng Bác Hồ", time: "07:00 AM - 20/10/2019", user: users[4], landmark: landmarks[4]),
                PostBO(name: "Có ai đi chơi không nào?", time: "10:00 AM - 20/10/2019", user: users[1], landmark: landmarks[0])]
    }
}
