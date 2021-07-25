//
//  Model.swift
//  CurrencyExchangeRate
//
//  Created by Danya on 25.07.2021.
//

import Foundation

class Currency {
    
    var NumCode: String?
    var CharCode: String?
    
    var Nominal: String?
    var nominalDouble: Double?
    
    var Name: String?
    
    var Value: String?
    var valueDoble: Double?
}

class Model: NSObject, XMLParserDelegate {
    
    static let shared = Model()
    
    var currencies: [Currency] = []
    
    var pathForXML: String {
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory,
                                                       FileManager.SearchPathDomainMask.userDomainMask,
                                                       true)[0]+"/data.xml"
        if FileManager.default.fileExists(atPath: path) {
            return path
        }
        
        Bundle.main.path(forResource: "data", ofType: "xml")
        
        print(path)
        return path
    }
    
    var urlForXML: URL {
        return URL(fileURLWithPath: pathForXML)
    }
    
    //загрузка XML с сайта
    func loadXMLFile(data : Data) {
        
    }
    //распарсить XML и положить его в currencies: [Currency], и отправить приложению уведомление что данные обновились
    func parseXML() {
        let parser = XMLParser(contentsOf: urlForXML)
        parser?.delegate = self
        parser?.parse()
    }
    
    var currentCurency: Currency?
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
}
