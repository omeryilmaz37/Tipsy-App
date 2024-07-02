//
//  ViewController.swift
//  Tipsy App
//
//  Created by Ömer Yılmaz on 10.05.2024.
//

import UIKit // UIKit çerçevesini içe aktarıyoruz

// CalculatorViewController sınıfı, UIViewController sınıfından türetiliyor
class CalculatorViewController: UIViewController {

    // Fatura miktarının girildiği metin alanı
    @IBOutlet weak var billTextField: UITextField!
    // %0 bahşiş butonu
    @IBOutlet weak var zeroPctButton: UIButton!
    // %10 bahşiş butonu
    @IBOutlet weak var tenPctButton: UIButton!
    // %20 bahşiş butonu
    @IBOutlet weak var twentyPctButton: UIButton!
    // Kişi sayısını gösteren etiket
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // Varsayılan bahşiş yüzdesi (%10)
    var tip = 0.10
    // Varsayılan kişi sayısı
    var numberOfPeople = 2
    // Fatura toplamı
    var billTotal = 0.0
    // Sonuç olarak hesaplanan tutar
    var finalResult = "0.0"
    
    // Bahşiş yüzdesi butonlarından biri değiştirildiğinde çağrılan fonksiyon
    @IBAction func tipChanged(_ sender: UIButton) {
        
        // Fatura giriş alanının düzenlenmesini sonlandırır (klavyeyi kapatır)
        billTextField.endEditing(true)
        
        // Tüm bahşiş butonlarını seçilmemiş duruma getirir
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        // Tıklanan butonu seçili hale getirir
        sender.isSelected = true
        
        // Tıklanan butonun başlığını alır (örneğin "%10")
        let buttonTitle = sender.currentTitle!
        // Başlıktan yüzde işaretini kaldırır (örneğin "10")
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        // Yüzdesel değeri sayıya dönüştürür (örneğin 10.0)
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        // Bahşiş yüzdesini ondalıklı sayıya dönüştürür (örneğin 0.10)
        tip = buttonTitleAsANumber / 100

    }
    
    // Kişi sayısı stepper'ı değiştirildiğinde çağrılan fonksiyon
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        // Etiketi stepper değeriyle günceller
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        // Kişi sayısını günceller
        numberOfPeople = Int(sender.value)
    }
    
    // Hesapla butonuna basıldığında çağrılan fonksiyon
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        // Fatura miktarını metin alanından alır
        let bill = billTextField.text!
        // Fatura miktarı boş değilse
        if bill != "" {
            // Fatura miktarını Double türüne dönüştürür
            billTotal = Double(bill)!
            // Kişi başına düşen tutarı hesaplar
            let result = billTotal * tip / Double(numberOfPeople)
            // Sonuç değerini String olarak saklar
            finalResult = String(format: "%.2f", result)
        }
        // Sonuç ekranına geçiş yapar
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    // Geçişten önce verilerin hedef ViewController'a hazırlanmasını sağlar
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Geçişin kimliğini kontrol eder
        if segue.identifier == "goToResults" {
            // Hedef ViewController'a referans alır
            let destinationVC = segue.destination as! ResultsViewController
            // Hesaplanan sonucu hedef ViewController'a aktarır
            destinationVC.result = finalResult
            // Bahşiş yüzdesini hedef ViewController'a aktarır
            destinationVC.tip = Int(tip * 100)
            // Kişi sayısını hedef ViewController'a aktarır
            destinationVC.split = numberOfPeople
        }
    }
}
