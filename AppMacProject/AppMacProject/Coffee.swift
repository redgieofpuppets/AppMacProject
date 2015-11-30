import UIKit
class Coffee: NSObject
{
    var name:String
    
    var shop:String
    
    var rating:Int
    
    init(name:String, shop:String, rating:Int) {
            self.name = name
            self.shop = shop
            self.rating = rating
            super.init()
    } 
}