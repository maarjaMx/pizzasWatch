//
//  Selecciones.swift
//  pizzasWatch
//
//  Created by Mirna Arellano on 24/01/16.
//  Copyright © 2016 Mirna Arellano. All rights reserved.
//

import WatchKit

class Selecciones: NSObject {
    
    var tamanoSeleccionado: String=""
    var quesoSeleccionado: String=""
    var masaSeleccionada: String=""
    var ingredientes: String=""
    var noIngredientes = 0
    
    init(t:String,  m:String, q:String, i:String, noIng:Int){
        tamanoSeleccionado=t
        quesoSeleccionado=q
        masaSeleccionada=m
        ingredientes=i
        noIngredientes=noIng
    }
    
    /*function setQueso(q:String){
        quesoSeleccionado=q
    }*/

}
