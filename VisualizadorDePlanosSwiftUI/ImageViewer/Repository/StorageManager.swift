//
//  StorageManager.swift
//  VisualizadorDePlanosSwiftUI
//
//  Created by Manuel Moyano on 10/07/2022.
//

import SwiftUI
import Firebase
import FirebaseStorage

class StorageManager: ObservableObject {
    let storage = Storage.storage()
    @Published var codigos = [Plano]()
    @Published var imageURL = URL(string: "")
    
    func upload(image: UIImage) {
        // Create a storage reference
        let storageRef = storage.reference().child("images/image.jpg")
        // Resize the image to 200px in height with a custom extension
        let resizedImage = image
        // Convert the image into JPEG and compress the quality to reduce its size
        let data = resizedImage.jpegData(compressionQuality: 0.2)
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpg"
        if let data = data {
                storageRef.putData(data, metadata: metadata) { (metadata, error) in
                        if let error = error {
                                print("Error while uploading file: ", error)
                        }

                        if let metadata = metadata {
                                print("Metadata: ", metadata)
                        }
                }
        }
    }
    func listAllFiles() {
        let storageRef = storage.reference().child("images")
        storageRef.listAll { (result, error) in
                if let error = error {
                        print("Error while listing all files: ", error)
                }

                for item in result.items {
                        print("Item in images folder: ", item)
                }
        }
    }
    func listItem() {
        // Create a reference
        let storageRef = storage.reference().child("Images")

        // Create a completion handler - aka what the function should do after it listed all the items
        let handler: (StorageListResult, Error?) -> Void = { (result, error) in
            if let error = error {
                print("error", error)
            }

            let item = result.items
            print("item: ", item)
        }

        // List the items
        storageRef.list(maxResults: 1, completion: handler)
    }
    func deleteItem(item: StorageReference) {
        item.delete { error in
            if let error = error {
                print("Error deleting item", error)
            }
        }
    }
    func listItems() async {
        let storageReference = storage.reference().child("Images")
        storageReference.listAll { (result, error) in
          if let error = error {
              print("Error deleting item", error)
              print("No entro a la funcion por un error")
              return
          }
//            for nombre in result.prefixes {
//              print (nombre)
//              print ("Se ingreso a la funcion, en la parte prefex")
//          }
          for item in result.items {
              self.codigos.append(Plano(codigo: item.fullPath))
              print (item)
              print ("Contador de items \(self.codigos.count)")
          }
        }
    }
    
    func loadImageFromFirebase(ubicacion: String) async {
             let storageRef = Storage.storage().reference(withPath: ubicacion)
              storageRef.downloadURL { (url, error) in
                     if error != nil {
                         print((error?.localizedDescription)!)
                         return
              }
                    self.imageURL = url!
              }
        }
    
}
