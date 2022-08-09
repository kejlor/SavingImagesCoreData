//
//  PhotoViewModel.swift
//  SavingImagesCoreData
//
//  Created by Bartosz Wojtkowiak on 09/08/2022.
//

import Foundation
import UIKit
import CoreData

class PhotoViewModel: ObservableObject {
    @Published var image: UIImage?
    private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    // zapisanie zdjecia i wyswietlenie 1 w tablicy po wlaczeniu aplikacji
    // dodatkowy kod
    init() {
        let request: NSFetchRequest<Photo> = NSFetchRequest(entityName: "Photo")
        do {
            let photos: [Photo] = try context.fetch(request)
            if let photo = photos.first {
                self.image = photo.content
            }
        } catch {
            print(error)
        }
    }
    
    func downloadImage() {
        // dodajemy uuid zeby za kazdym razem otrzymac unikalny obraz
        let url = URL(string: "https://picsum.photos/200/300?id=\(UUID().uuidString)")!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            let photo = Photo(context: self.context)
            photo.title = "Random Photo"
            photo.content = UIImage(data: data)
            
            try? self.context.save()
            
            DispatchQueue.main.async {
                self.image = photo.content
            }
        }.resume()
    }
}
