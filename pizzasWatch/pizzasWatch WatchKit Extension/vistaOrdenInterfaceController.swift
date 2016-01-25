//
//  vistaOrdenInterfaceController.swift
//  pizzasWatch
//
//  Created by Mirna Arellano on 24/01/16.
//  Copyright © 2016 Mirna Arellano. All rights reserved.
//

import WatchKit
import Foundation


class vistaOrdenInterfaceController: WKInterfaceController {
    
    @IBOutlet var tamanoLabel: WKInterfaceLabel!
    
    @IBOutlet var masaLabel: WKInterfaceLabel!
    
    @IBOutlet var quesoLabel: WKInterfaceLabel!
    
    @IBOutlet var ingredientesLabel: WKInterfaceLabel!
    
    @IBOutlet var mensajeConfirmacion: WKInterfaceLabel!
    
    var tamanoSeleccionado=""
    var masaSeleccionada=""
    var quesoSeleccionado=""
    var ingredientesSeleccionados=""
    var noIngredientes=0
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c=context as! Selecciones
        tamanoLabel.setText("T: "+c.tamanoSeleccionado)
        tamanoSeleccionado=c.tamanoSeleccionado
        masaLabel.setText("M: "+c.masaSeleccionada)
        masaSeleccionada=c.masaSeleccionada
        quesoLabel.setText("Q:"+c.quesoSeleccionado)
        quesoSeleccionado=c.quesoSeleccionado
        ingredientesLabel.setText(String(c.noIngredientes))
        ingredientesSeleccionados=c.ingredientes
        
        noIngredientes=c.noIngredientes
       
        mensajeConfirmacion.setText("Max 5 ingredientes")
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    @IBAction func confirmarOrden() {
        
        let valorContexto = Selecciones(t:tamanoSeleccionado, m:masaSeleccionada, q:quesoSeleccionado, i:ingredientesSeleccionados, noIng: noIngredientes)
        pushControllerWithName("IdentificadorOrden", context: valorContexto)

    }
   
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
