//
//  Photo+CoreDataProperties.swift
//
//
//  Created by Bartosz Wojtkowiak on 9.08.2022.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Photo)
class Photo: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var content: UIImage?
    @NSManaged public var title: String?

}

extension Photo : Identifiable {

}
