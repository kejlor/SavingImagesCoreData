//
//  ContentView.swift
//  SavingImagesCoreData
//
//  Created by Bartosz Wojtkowiak on 09/08/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var photoVM = PhotoViewModel()
    
    var body: some View {
        VStack {
            if let image = photoVM.image {
                Image(uiImage: image)
            }
            
            Button("Download Image") {
                photoVM.downloadImage()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
