//
//  vistaConfirmacionInterfaceController.swift
//  pizzasWatch
//
//  Created by Mirna Arellano on 24/01/16.
//  Copyright © 2016 Mirna Arellano. All rights reserved.
//

import WatchKit
import Foundation


class vistaConfirmacionInterfaceController: WKInterfaceController {
    
    var tamanoSeleccionado=""
    var masaSeleccionada=""
    var quesoSeleccionado=""
    var ingredientesSeleccionados=""
    var noIngredientes=0
    var mensaje=""
    @IBOutlet var confirmacionLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        
        let c=context as! Selecciones
        tamanoSeleccionado=c.tamanoSeleccionado
        masaSeleccionada=c.masaSeleccionada
        quesoSeleccionado=c.quesoSeleccionado
        ingredientesSeleccionados=c.ingredientes
        noIngredientes=c.noIngredientes
        
        if tamanoSeleccionado=="" || masaSeleccionada=="" || quesoSeleccionado=="" || noIngredientes>5{
            mensaje="La orden no se puede confirmar"
        }else{
            mensaje="Su orden fue enviada"
        }
        confirmacionLabel.setText(mensaje)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        

    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
