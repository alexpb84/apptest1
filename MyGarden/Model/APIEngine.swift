//
//  APIEngine.swift
//  MyGarden
//
//  Created by Alex on 9/10/16.
//  Copyright © 2016 alexpribe. All rights reserved.
//

import UIKit
import Foundation

class APIEngine: AFHTTPSessionManager {
    
    
    
    static let sharedInstance = APIEngine()
    
    convenience init(){
        
        // Network activity indicator manager setup
        AFNetworkActivityIndicatorManager.shared().isEnabled = true;
        
        // Session configuration setup
        let  sessionConfiguration : URLSessionConfiguration = URLSessionConfiguration.default
        
        let headers : [String:String] = [
             "Content-Type" : "application/json",
            "Accept": "application/json"
        ]
        
        sessionConfiguration.httpAdditionalHeaders = headers;
        
        
        //Enable url cache in session configuration and assign capacity
        sessionConfiguration.urlCache = URLCache.shared
        sessionConfiguration.urlCache = URLCache(memoryCapacity: 10 * 1024 * 1024 , diskCapacity: 50 * 1024 * 1024, diskPath: nil)
        
        self.init(baseURL: NSURL(string: Connections.ApiURL)!, sessionConfiguration: sessionConfiguration)
        
    }
        
    private init(baseURL : NSURL!, sessionConfiguration :URLSessionConfiguration) {
        
        super.init(baseURL: baseURL as URL?, sessionConfiguration: sessionConfiguration)
        
        // Reachability
        self.reachabilityManager.startMonitoring();
        
        
//        self.qualityOfservice = NSQualityOfServiceBackground;
//        
        self.requestSerializer.timeoutInterval = TimeInterval(Settings.TimeoutInterval);
        
        

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func dataTask(with request: URLRequest, completionHandler: ((URLResponse, Any?, Error?) -> Void)? = nil) -> URLSessionDataTask {
        
        var modifiedRequest : URLRequest = request
        
        let reachability : AFNetworkReachabilityManager = self.reachabilityManager
        
        if (!reachability.isReachable)
        {
            modifiedRequest.cachePolicy = .returnCacheDataDontLoad
        }
        else{
            modifiedRequest.cachePolicy = .useProtocolCachePolicy
        }
        
        return super.dataTask(with: modifiedRequest, completionHandler: completionHandler)
        
    }
    
    
}
