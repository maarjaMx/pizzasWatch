//
//  vistaMasaInterfaceController.swift
//  pizzasWatch
//
//  Created by Mirna Arellano on 24/01/16.
//  Copyright © 2016 Mirna Arellano. All rights reserved.
//

import WatchKit
import Foundation


class vistaMasaInterfaceController: WKInterfaceController {
    
    @IBOutlet var tamanoLabel: WKInterfaceLabel!
    
    @IBOutlet var masaLabel: WKInterfaceLabel!
    @IBOutlet var MasaPicker: WKInterfacePicker!
    
    var masa: String=""
    var tamanoSeleccionado=""
    
    var masaList: [(String, String)] = [
        ("Masa1", "Delgada"),
        ("Masa2", "Crujiente"),
        ("Masa3", "Gruesa")]

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c=context as! Selecciones
        tamanoLabel.setText("Tamaño: "+c.tamanoSeleccionado)
        tamanoSeleccionado=c.tamanoSeleccionado
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = masaList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        MasaPicker.setItems(pickerItems)

    }

    @IBAction func obtenerMasa(value: Int) {
        masaLabel.setText(masaList[value].1)
        masa = masaList[value].1
    }
    
    @IBAction func seleccionaQueso() {
        let valorContexto = Selecciones(t:tamanoSeleccionado, m:masa, q:"", i:"", noIng: 0)
        pushControllerWithName("IdentificadorMasa", context: valorContexto)
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
