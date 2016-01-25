//
//  vistaIngredientesInterfaceController.swift
//  pizzasWatch
//
//  Created by Mirna Arellano on 24/01/16.
//  Copyright © 2016 Mirna Arellano. All rights reserved.
//

import WatchKit
import Foundation


class vistaIngredientesInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var jamonSwitch: WKInterfaceSwitch!
    @IBOutlet var pepperoniSwitch: WKInterfaceSwitch!
    @IBOutlet var pavoSwitch: WKInterfaceSwitch!
    @IBOutlet var salchicaSwitch: WKInterfaceSwitch!
    
    @IBOutlet var cebollaSwitch: WKInterfaceSwitch!
    @IBOutlet var aceitunaSwitch: WKInterfaceSwitch!
    @IBOutlet var pimientoSwitch: WKInterfaceSwitch!
    @IBOutlet var piñaSwitch: WKInterfaceSwitch!
    @IBOutlet var anchoaLabel: WKInterfaceSwitch!
    @IBOutlet var tamanoLabel: WKInterfaceLabel!
    
    @IBOutlet var masaLabel: WKInterfaceLabel!
    
    @IBOutlet var quesoLabel: WKInterfaceLabel!
    
    var tamanoSeleccionado=""
    var masaSeleccionada=""
    var quesoSeleccionado=""
    var ingredientesSeleccionados=""
    var noIngredientes=0
    
    var jamon=false
    var pepperoni=false
    var pavo=false
    var salchicha=false
    var aceituna=false
    var cebolla=false
    var pimiento=false
    var pina=false
    var anchoa=false
    
    var ingredientes: [(String)] = []
    

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c=context as! Selecciones
        tamanoLabel.setText("T: "+c.tamanoSeleccionado)
        tamanoSeleccionado=c.tamanoSeleccionado
        masaLabel.setText("M: "+c.masaSeleccionada)
        masaSeleccionada=c.masaSeleccionada
        quesoLabel.setText("Q:"+c.quesoSeleccionado)
        quesoSeleccionado=c.quesoSeleccionado

        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    @IBAction func isJamon(value: Bool) {
        jamon=value
    }

    @IBAction func isPepperoni(value: Bool) {
        pepperoni=value
    }
    
    @IBAction func isPavo(value: Bool) {
        pavo=value
    }
    
    @IBAction func isSalchicha(value: Bool) {
        salchicha=value
    }
    
    @IBAction func isAceituna(value: Bool) {
        aceituna=value
    }
   
    @IBAction func isCebolla(value: Bool) {
        cebolla=value
    }
    
    
    @IBAction func isPimiento(value: Bool) {
        pimiento=value
    }
    
    @IBAction func isPina(value: Bool) {
        pina=value
    }
    
    @IBAction func isAnchoa(value: Bool) {
        anchoa=value
    }
    
    
    func obtenerIngredientes(){
        if (jamon==true){
            ingredientes.append("Jamon")
        }
        if (pepperoni==true){
            ingredientes.append("Pepperoni")
        }
        if (pavo==true){
            ingredientes.append("Pavo")
        }
        if (salchicha==true){
            ingredientes.append("Salchicha")
        }
        if (aceituna==true){
            ingredientes.append("Aceituna")
        }
        if (cebolla==true){
            ingredientes.append("Cebolla")
        }
        if (pimiento==true){
            ingredientes.append("Pimiento")
        }
        if (pina==true){
            ingredientes.append("Piña")
        }
        if (anchoa==true){
            ingredientes.append("Anchoa")
        }
        
        
        noIngredientes = ingredientes.count
        
        for var i=0; i < ingredientes.count; i++ {
            ingredientesSeleccionados+=ingredientes[i]+","
        }
    }
    
    @IBAction func muestraOrden() {
        obtenerIngredientes()
        let valorContexto = Selecciones(t:tamanoSeleccionado, m:masaSeleccionada, q:quesoSeleccionado, i:ingredientesSeleccionados, noIng: noIngredientes)
        
        pushControllerWithName("IdentificadorIngredientes", context: valorContexto)
        ingredientes.removeAll()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
