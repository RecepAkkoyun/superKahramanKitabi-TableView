//
//  ViewController.swift
//  superKahramanKitabi
//
//  Created by Recep Akkoyun on 28.07.2022.
//


//TableView bizden 2 fonksiyon istiyor. birinci fonk. aşağı doğru kaç hücre olcağı, ikinci fonk. ise hücrelerde ne olacağı.
// 1. fonk = numberOfRowsInsection -> Kaç tane row olacak ?
// 2. fonk = cellForRow atIndexPath -> hücrenin içersinde neler gösterilecek ?

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    var alinanKahramanIsmi = ""
    var alinanKahramanResmiIsmi = ""
    
    
    var superKahramanIsimleri = [String]() // Buraya dizi oluşturdum her yerden ulaşmak için
    var superKahramanResimleri = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Ekliceğim Süper kahramanların İsimlerini yazıyorum.
        
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Hulk")
        superKahramanIsimleri.append("ironman")
        superKahramanIsimleri.append("spiderman")
        superKahramanIsimleri.append("superman")
        
        // Şİmdi de kahramanların fotoğraflarını diziye atıcam
        superKahramanResimleri.append("batman")
        superKahramanResimleri.append("hulk")
        superKahramanResimleri.append("ironman")
        superKahramanResimleri.append("spiderman")
        superKahramanResimleri.append("superman")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count // süper kahramanlar isimli dizimin elemanları kadar sütun ekle
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row] // indexpath.row süper kahraman isimleri dizisindeki indekleri teker teker                                                              yaz dedim.
            return cell
    }
    // sütunu sağa kaydırıp silmek istersem;
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            superKahramanIsimleri.remove(at: indexPath.row)
                                                            //Kullanıcının silmek istediği yeri sil dedim şimdi tableviewi güncellicem.
            superKahramanResimleri.remove(at: indexPath.row)
            
            //Guncelleme islemi
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
        }
    }
    
    //Şimdi rowa (Sütuna) tıklanınca bir şey yap dicem.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        alinanKahramanResmiIsmi = superKahramanResimleri[indexPath.row]
        alinanKahramanIsmi = superKahramanIsimleri[indexPath.row]
        
        //toDetails e git diyorum
        performSegue(withIdentifier: "toDetails", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails"{
            let destinationVC = segue.destination as! detailsContrroller
            destinationVC.girilenKahramanResmiIsmi = alinanKahramanResmiIsmi
            destinationVC.girilenKahramanIsmi = alinanKahramanIsmi
        }
    }
    
}

