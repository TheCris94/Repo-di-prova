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
var activities: [Activity] = [Activity(name: "Energy Efficiency", details: "Switch to energy-efficient light bulbs, reduce energy usage by turning off lights and electronics when not in use, and make sure your home is properly insulated."), Activity(name: "Water conservation", details: "Turn off the water when you don’t need it (for example when you wash your teeth); choosing the shower instead of the bath; install vented faucets; fix dripping faucets; washing machine and dishwasher only when fully loaded."), Activity(name: "Sustainable transportation", details: "Walking, cycling, using public transport, using car sharing are just a few examples of what today is defined as sustainable mobility, that is, the set of virtuous practices that reconcile the need to move with that of reducing air and noise pollution."), Activity(name: "Sustainable food choices", details: "Look for products that limit the use of pesticides, deforestation, intensive farming and carbon dioxide emissions into the atmosphere. We must prefer products of local origin instead of those that travel on polluting vehicles. ", image: "Garbage"), Activity(name: "Green purchasing", details: "Contribute to the green market by purchasing sustainable products."), Activity(name: "Reduce chemical usage", details: "Use natural household products, biological agriculture, ecological clothing; avoid storing household chemicals in closed and poorly ventilated rooms."), Activity(name: "Support renewable energy", details:"Use of solar power with solar panels, wind energy, hydroelectric energy ecc. These renewable sources are sustainable and allow electricity to be produced cleanly."), Activity(name: "Waste sorting", details: "Select the wet/organic material, glass, aluminium, plastic, paper; collect some types of waste separately with the aim of making their subsequent disposal and reuse more convenient and safer."), Activity(name: "Recycle plastic", details: "Carefully wash the plastic containers, before placing them in the appropriate bin; remove any paper labels, to dispose of them separately; reduce the size of plastic waste, such as bottles, by crushing them as much as possible."), Activity(name:"Recycle old clothes", details:"Collect used clothing, shoes and accessories in special bins by companies registered as environmental managers."), Activity(name: "Do plogging", details: "Jogging with a small variation, very rapid pauses to bend down, collect the garbage that is on the ground and then resume the run."), Activity(name:"Planting plants", details:"Choose the right location, dig the hole for the plant, put the plant in the hole, cover with earth and water thoroughly."), Activity(name: "Take care of animals", details: "You need to make time for it every day. On a daily basis, in addition to going for walks, it is necessary to play with him and give him affection and hygienic care.")]


