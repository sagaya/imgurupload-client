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
    internal static var baseUrl = "https://api.imgur.com/3/upload"
    internal static var imageData:Data?
    internal static var apiKey:String?
    

    open static func upload(imageData: Data = imageData!, apiKey: String = apiKey!, completionHandler: @escaping (DataResponse<Any>?) ->()){
        let headers: HTTPHeaders = ["Authorization": "Client-ID \(apiKey)"]
        Alamofire.upload(imageData, to: ImgurUpload.baseUrl, method: .post, headers: headers).responseJSON { (response) in
            completionHandler(response)
        }
    }
}
