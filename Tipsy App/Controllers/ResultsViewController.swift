//
//  ResultsViewController.swift
//  Tipsy App
//
//  Created by Ömer Yılmaz on 12.05.2024.
//

import UIKit // UIKit çerçevesini içe aktarıyoruz

// ResultsViewController sınıfı, UIViewController sınıfından türetiliyor
class ResultsViewController: UIViewController {
    
    // Toplam tutarı gösteren etiket
    @IBOutlet weak var totalLabel: UILabel!
    // Ayarları gösteren etiket (bahşiş yüzdesi ve kişi sayısı)
    @IBOutlet weak var settingsLabel: UILabel!
    
    // Hesaplanan sonuç (kişi başına düşen tutar)
    var result = "0.0"
    // Bahşiş yüzdesi
    var tip = 10
    // Kişi sayısı
    var split = 2
    
    // View yüklendiğinde çağrılan fonksiyon
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hesaplanan sonucu etikete yerleştirir
        totalLabel.text = result
        // Ayarları etikete yerleştirir
        settingsLabel.text = "\(split) Kişi arasında, \(tip)% bahşiş ile paylaştırıldı."

    }
    
    // Yeniden hesapla butonuna basıldığında çağrılan fonksiyon
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        // Bu ViewController'ı kapatır ve önceki ViewController'a geri döner
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

