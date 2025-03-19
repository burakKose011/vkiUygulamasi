//
//  kadinController.swift
//  vkiUygulamasi
//
//  Created by macbook on 29.08.2024.
//

import UIKit

class kadinController: UIViewController {

   
    @IBOutlet weak var kadinBoyTextField: UITextField!
    @IBOutlet weak var kadinKiloTextField: UITextField!
    
    @IBOutlet weak var yuzeyAlanLabel: UILabel!
    @IBOutlet weak var idealKiloLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var sonucLabel: UILabel!
    
    @IBOutlet weak var temizleButon: UIButton!
    @IBOutlet weak var hesaplaButon: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        temizleButon.layer.cornerRadius = 15
        hesaplaButon.layer.cornerRadius = 15
    }
    
    @IBAction func temizleButton(_ sender: Any) {
        
        yuzeyAlanLabel.text = "Vücut Yüzey Alanınız:"
        idealKiloLabel.text = "İdeal Kilonuz:"
        bmiLabel.text = "BMI:"
        sonucLabel.text = "Sonuç:"
        kadinBoyTextField.text = ""
        kadinKiloTextField.text = ""
        
    }
    
    @IBAction func hesaplaButton(_ sender: Any) {
        
        
        func alertOlustur(titleGirdisi: String, messageGirdisi: String) {
            
            let uyariMesaji = UIAlertController(title: titleGirdisi, message: messageGirdisi, preferredStyle: UIAlertController.Style.alert)
            
            let okButtton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
                // ok button una tıklanınca olacaklar
            }
            
            uyariMesaji.addAction(okButtton)  // uyarı mesajına buttonu ekledik
            self.present(uyariMesaji, animated: true, completion: nil)
        }
        
        if kadinBoyTextField.text == "" && kadinKiloTextField.text == "" {
            alertOlustur(titleGirdisi: "HATA!", messageGirdisi: "Lütfen geçerli bir boy(cm) ve kilo(kg) giriniz")
        }
        
        else if kadinBoyTextField.text == "" {
            alertOlustur(titleGirdisi: "HATA!", messageGirdisi: "Lütfen geçerli bir boy(cm) giriniz. ")
        }
        
        else if kadinKiloTextField.text == "" {
            alertOlustur(titleGirdisi: "HATA!", messageGirdisi: "Lütfen geçerli bir kilo(kg) giriniz.")
        }
        
        
        else{
            
            
            if let agirlik = Double(kadinKiloTextField.text!){
                if let boy = Double(kadinBoyTextField.text!){
                    
                    //  Formül: ((ağırlık(kg) x boy(cm))/3600) Vücut yüzeyi boy ve ağırlık bilgisi kullanılarak hesaplanır.
                    let yuzeyAlani = Double((agirlik * boy) / 3600)
                    let yA = sqrt(yuzeyAlani)
                    yuzeyAlanLabel.text = "Vücut Yüzey Alanınız: \(String(format: "%.2f", yA)) mkare"
                    
                    
                    // Kadınlarda: 45,5 + 2,3 X (İnç cinsinden boy - 60)
                    let idealKilo = Int(45.5 + 2.3 * (boy/2.54 - 60))
                    idealKiloLabel.text = "İdeal Kilonuz: \(idealKilo) kg"
                    // 50 + 2,3 X (İnç cinsinden boy - 60)
                    
                    // Örnek VKİ hesaplama; Ağırlık: 58 kg Boy: 1,59 m VKİ: 58 / (1,59)*(1,59) = 22,9 kg/m2
                    let bmi = agirlik / ((boy/100) * (boy/100))
                    bmiLabel.text = "BMI: \(String(format: "%.2f", bmi)) kg / metrekare"
                    
                    /*
                     18,5 kg/m2 ve daha düşük değerler = Zayıf
                     18,5 ve 24,9 kg/m2 arasındaki değerler = Normal ağırlıkta
                     25,0 ve 29,9 kg/m2 arasındaki değerler = Kilolu
                     30,0 ve 34,9 kg/m2 arasındaki değerler = 1. derece obezite
                     35,0 ve 39,9 kg/m2 arasındaki değerler = 2. derece obezite
                     40 kg/m2 ve üzerindeki değerler = 3. derece obezite
                     */
                    
                    if bmi < 18.5 {
                        sonucLabel.text = "Sonuç: İdeal kilonuzun altındasınız"
                    }
                    else if bmi < 25 {
                        sonucLabel.text = "Sonuç: Kilonuz tamamen normal"
                    }
                    else if bmi < 30 {
                        sonucLabel.text = "Sonuç: İdeal kilonuzun üstündesiniz"
                    }
                    else if bmi < 35 {
                        sonucLabel.text = "Sonuç: Şişman (Obez) - I. Sınıf"
                    }
                    else if bmi < 45 {
                        sonucLabel.text = "Sonuç: Şişman (Obez) - II. Sınıf"
                    }
                    else if bmi >= 45 {
                        sonucLabel.text = "Sonuç: Şişman (Aşırı Obez) - III. Sınıf"
                    }
                }
            }
        }
      
    }
    

}
