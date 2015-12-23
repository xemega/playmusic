//
//  ViewController.swift
//  playmusic
//
//  Created by César Méndez on 22/12/15.
//  Copyright © 2015 César Méndez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var reproductor: AVAudioPlayer!
   
    var bandera : Int = 0
    

    let archivos : [String] = ["1 - Tina Turner - Simply the best","2 - James Brown - I feel good","3 - Queen - I want to break free","4 - Beyonce - All I could do is cry","5 - Barry White - My First My Last My Everything"]
    
    let artistas : [String] = ["Tina Turner","James Brown","Queen","Beyonce","Barry White"]
    
     let portadas : [String] = ["Tina Turner.jpg","James Brown.jpg","Queen.jpg","Beyonce.jpg","Barry White.jpg"]
    
    let canciones : [String] = ["Simply the best","I feel good","I want to break free","All I could do is cry","My First My Last My Everything"]
    
    @IBOutlet weak var outPortada: UIImageView!
    @IBOutlet weak var outCancion: UILabel!
    @IBOutlet weak var outArtista: UILabel!
    
    @IBOutlet weak var outVolumen: UISlider!
    
    
    @IBAction func accionVolumen(sender: AnyObject) {
        
        reproductor.volume=outVolumen.value
    }
    
    @IBAction func accionTocar(sender: AnyObject) {
        if bandera == 1 {
        if !reproductor.playing {
            reproductor.play()
        }
        }
        
    }
    
    @IBAction func accionPausar(sender: AnyObject) {
        if bandera == 1 {
        if reproductor.playing {
            reproductor.pause()
        }
        }
    }
    
    @IBAction func accionDetener(sender: AnyObject) {
        if bandera == 1 {
        if reproductor.playing {
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
        }
    }
    
    @IBAction func accionShuffle(sender: AnyObject) {
        let num = Int(arc4random() % 5)
        reproducir(num)
    }
    
    @IBAction func accionTina(sender: AnyObject) {
        reproducir(0)
    }
    
    @IBAction func accionQueen(sender: AnyObject) {
        reproducir(2)
    }
    
    @IBAction func accionBeyonce(sender: AnyObject) {
        reproducir(3)
    }
    
    @IBAction func accionBarry(sender: AnyObject) {
        reproducir(4)
    }
    
    @IBAction func accionJames(sender: AnyObject) {
        reproducir(1)
    }
    
    func reproducir(valor : Int)
    {
        
        outArtista.text=artistas[valor]
        outCancion.text=canciones[valor]
        outPortada.image = UIImage(named: portadas[valor])
        
        
        let sonidoURL = NSBundle.mainBundle().URLForResource(archivos[valor], withExtension: "mp3")
        
        do { try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            if !reproductor.playing {
                reproductor.volume=outVolumen.value
                reproductor.play()
                bandera = 1
            }
            
        }catch{
            let alerta = UIAlertController(title: "Aviso", message:  "No se puede reproducir el archivo", preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alerta.addAction(defaultAction)
            self.presentViewController(alerta, animated: true, completion: nil)

        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

