//
//  activities.swift
//  Biolyst
//
//  Created by loriscatalano on 20/02/23.
//

import Foundation


//Creates a new class named Activity, that has all the information we need to display about an activity
class Activity: Identifiable{
    init(name: String, details: String, image: String){
        self.name = name
        self.details = details
        self.image = image
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.date = "01/01/1900"
        
    }
    init(name: String, details: String){
        self.name = name 
        self.details = details
        
        
        
    }
    
    var name: String = "" 
    
    var details: String = ""
    
    var image: String = "LightBulb" //default image
    
    var is_ongoing = true
    
    var saving = 0.0 //saving of co2
    
    var date: String = "01/01/1900"
    
    func set_Ongoing(booleano: Bool){
        if(booleano == true){
            self.is_ongoing = true
        }
        else if (booleano == false){
            self.is_ongoing = false
        }
    }
    
    func setDate(){
        var today_date: Date = Date.now
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.date = formatter.string(from: today_date)
    }

    
}


// New array of Activities, to simply get them in our MainView
var activities: [Activity] = [Activity(name: "Energy Efficiency", details: "dettagli energy efficiency"), Activity(name: "Water conservation", details: "dettagli water conservation"), Activity(name: "Sustainable transportation", details: "dettagli sustainable transportation widmfoiwdmofmsefdivjosdviejo ioiov efjoi dfjvies jvioae jsio jvioe jveioa jfadio dajioas djoai iasjoia jdoi avdsio jdsiosd jdsiojv io vajoi aj/wef"), Activity(name: "Sustainable food choices", details: "dettagli sustainable food choices  widmfoiwdmofmsefdivjosdviejo ioiov efjoi dfjvies jvioae jsio jvioe jveioa jfadio dajioas djoai iasjoia jdoi avdsio jdsiosd jdsiojv io vajoi aj/wef  widmfoiwdmofmsefdivjosdviejo ioiov efjoi dfjvies jvioae jsio jvioe jveioa jfadio dajioas djoai iasjoia jdoi avdsio jdsiosd jdsiojv io vajoi aj/wef5", image: "Garbage")]


