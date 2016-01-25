//
//  InterfaceController.swift
//  pizzasWatch WatchKit Extension
//
//  Created by Mirna Arellano on 24/01/16.
//  Copyright © 2016 Mirna Arellano. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController{
    
    @IBOutlet var tamanoLabel: WKInterfaceLabel!
   
    @IBOutlet var tamanosPicker: WKInterfacePicker!
    
    var tamano : String = ""

    var tamanosList: [(String, String)] = [
        ("tamaño1", "Chica"),
        ("tamaño2", "Mediana"),
        ("tamaño3", "Grande")]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = tamanosList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        tamanosPicker.setItems(pickerItems)
        
    }

    @IBAction func obtenTamano(value: Int) {
        NSLog("List Picker: \(tamanosList[value].0) selected")
        tamanoLabel.setText(tamanosList[value].1)
        tamano = tamanosList[value].1
        
    }
    
    @IBAction func seleccionaMasa() {
        let valorContexto = Selecciones(t:tamano,m:"", q:"", i:"", noIng: 0)
        pushControllerWithName("IdentificadorTamano", context: valorContexto)
   
    }
    
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
