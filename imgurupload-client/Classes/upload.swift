//
//  upload.swift
//  Pods
//
//  Created by Sagaya Abdulhafeez on 01/04/2017.
//
//

import UIKit
import Alamofire

open class ImgurUpload {
    open static var baseUrl = "https://api.imgur.com/3/upload"
    open static var imageData:Data?
    open static var apiKey:String?
    
    internal static var touchHandler: (() -> DataResponse<Any>)?

    open static func upload(imageData: Data = imageData!, apiKey: String = apiKey!, completionHandler: @escaping (DataResponse<Any>?) ->()){
        let headers: HTTPHeaders = ["Authorization": "Client-ID \(apiKey)"]
        Alamofire.upload(imageData, to: ImgurUpload.baseUrl, method: .post, headers: headers).responseJSON { (response) in
            completionHandler(response)
        }
    }
}
