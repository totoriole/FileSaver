//
//  main.swift
//  FileSaver
//
//  Created by Toto Tsipun on 20.02.2023.
//

import Foundation

print("Hello, my friend! It's FileSaver")

print("Please, enter your text and push Enter:")

var userMessage: String = ""

if let message = readLine() {
    userMessage = message
}

let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
let filename = "userText.txt"
let file = getDocumentsDirectory().appendingPathComponent(filename)

func getDocumentsDirectory() -> URL {
    return paths[0]
}

func recordNewMessage(nameFile: String) {
//    if paths.count > 0 {
//     if filename == nameFile {
    if let handler = try? FileHandle(forWritingTo: file) {
        print("file.txt found")
        handler.seekToEndOfFile()
        handler.write(("\n" + userMessage).data(using:.utf8)!)
        handler.closeFile()
    } else {
        do {
            try userMessage.write(to: file, atomically: false, encoding: String.Encoding.utf8)
        } catch {
            print("Error: File don't create")
        }
    }
}

recordNewMessage(nameFile: filename)

//func saveFile(str: String) {
//    let tmpURl = FileManager.default.homeDirectoryForCurrentUser
//    let fileName = "userText.txt"
//    let text = userMessage
//    let data = text.data(using: .utf8)
//    let fileURL = tmpURl.appendingPathComponent(fileName)
//    FileManager.default.createFile(atPath: fileURL.path, contents: data)
//}
//
//saveFile(str: userMessage)

