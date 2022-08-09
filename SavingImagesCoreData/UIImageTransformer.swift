//
//  UIImageTransformer.swift
//  SavingImagesCoreData
//
//  Created by Bartosz Wojtkowiak on 09/08/2022.
//

import Foundation
import UIKit

// kiedy uzywamy ValueTransformer musimy nadpisac specyficzne funkcje
class UIImageTransformer: ValueTransformer {
    
    // archiwizuje dane do Core Data za pomoca NSKeyedArchiver
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }
        
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    
    // zmieniamy z danych na nasz oczekiwany typ dzieki NSKeyedUnarchiver
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let image = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIImage.self, from: data)
            return image
        } catch {
            return nil
        }
    }
}
