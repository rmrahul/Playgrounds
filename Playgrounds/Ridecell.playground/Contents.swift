import Foundation
//List of citys.. Most common cities
//Most common.. Pune, Mumbai, Pune, Kop, Kop

func findCommonCity(array : Array<String>) -> [String]?{
    var dict : [String : Int] = [:]

    for city in array {
        if let currentCount = dict[city]{
            dict[city] = currentCount + 1
        }
        else{
            dict[city] = 1
        }
    }
    
    let max = dict.values.max()
    let arrayOfCities = dict.filter({ (arg0) -> Bool in
        let (_, value) = arg0
        if(value == max){
            return true
        }
        return false
    }).map({ (arg0) -> String in
        let (key,_) = arg0
        return key;
    })
    
    
    return arrayOfCities;
}

var arrayOfCities = ["Pune","Pune", "Mumbai","Mumbai","Kolhapur"]

var str = findCommonCity(array: arrayOfCities)

print("City ", str)









//
//Error Handling








