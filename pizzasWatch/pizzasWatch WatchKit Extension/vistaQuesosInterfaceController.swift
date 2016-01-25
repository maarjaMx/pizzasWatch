//
//  vistaQuesosInterfaceController.swift
//  pizzasWatch
//
//  Created by Mirna Arellano on 24/01/16.
//  Copyright © 2016 Mirna Arellano. All rights reserved.
//

import WatchKit
import Foundation


class vistaQuesosInterfaceController: WKInterfaceController {

    @IBOutlet var masaLabel: WKInterfaceLabel!
    
    @IBOutlet var tamanoLabel: WKInterfaceLabel!
    
    @IBOutlet var quesoLabel: WKInterfaceLabel!
    
    @IBOutlet var quesoPicker: WKInterfacePicker!
    
    var tamanoSeleccionado=""
    var masaSeleccionada=""
    var queso=""
    
    var quesosList: [(String, String)] = [
        ("Queso1", "Mozarela"),
        ("Queso2", "Cheddar"),
        ("Queso3", "Parmesano"),
        ("Queso4", "Sin queso")]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c=context as! Selecciones
        tamanoLabel.setText("Tamaño: "+c.tamanoSeleccionado)
        tamanoSeleccionado=c.tamanoSeleccionado
        masaLabel.setText("Masa: "+c.masaSeleccionada)
        masaSeleccionada=c.masaSeleccionada
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        let pickerItems: [WKPickerItem] = quesosList.map {
            let pickerItem = WKPickerItem()
            pickerItem.caption = $0.0
            pickerItem.title = $0.1
            return pickerItem
        }
        quesoPicker.setItems(pickerItems)
        
    }

    
    @IBAction func obtenQueso(value: Int) {
        quesoLabel.setText(quesosList[value].1)
        queso = quesosList[value].1
    }
    
    
    @IBAction func selectIngredientes() {
        let valorContexto = Selecciones(t:tamanoSeleccionado, m:masaSeleccionada, q:queso, i:"", noIng: 0)
        pushControllerWithName("IdentificadorQueso", context: valorContexto)
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
