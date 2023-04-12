//
//  SQLite.swift
//  Exam Local Data Base
//
//  Created by HARSHID PATEL on 12/04/23.
//

import Foundation
import SQLite3

struct Model{
    var id: Int
    var name: String
}

class SqliteHelper{
    static var file: OpaquePointer?
    
    static func createFile(){
        var z = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        z.appendPathComponent("My local Data Base.db")
        sqlite3_open(z.path, &file)
        print(z.path)
        print("File Create")
        createTable()
    }

    static func createTable(){
        var x = "Create Table if not exists Students (id integer,name text)"
        var table: OpaquePointer?
        sqlite3_prepare(file, x, -1, &table, nil)
        print("Create Table")
        sqlite3_step(table)
    }
    
    static func addData(id:Int,name:String){
        var x = "insert into Students values (\(id),'\(name)')"
        var data: OpaquePointer?
        sqlite3_prepare(file, x, -1, &data, nil)
        print("Add Data")
        sqlite3_step(data)
    }
    
    static func getData()->[Model]{
        var arr = [Model]()
        
        let q = "select name,id from students"
        var get: OpaquePointer?
        sqlite3_prepare(file, q, -1, &get, nil)
       
        
        while sqlite3_step(get) == SQLITE_ROW{
            let id = sqlite3_column_int64(get, 1)
            print("id = \(id)",terminator: "")
            
            if let cString = sqlite3_column_text(get, 0){
                let name = String(cString: cString)
                arr.append(Model( id: Int(id), name: name))
            }
        }
        print("Get Data")
        return arr
    }
    
    static func deleteData(id:Int,name:String){
        let x = "DELETE FROM Students WHERE id = \(id)"
        var delete: OpaquePointer?
        sqlite3_prepare(file, x, -1, &delete, nil)
        print("Delete Data")
        sqlite3_step(delete)
    }
}
