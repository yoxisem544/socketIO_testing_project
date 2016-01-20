//
//  ViewController.swift
//  socketTest
//
//  Created by David on 2016/1/6.
//  Copyright © 2016年 David. All rights reserved.
//

import UIKit
import Socket_IO_Client_Swift

class ViewController: UIViewController {
    
    var s: SocketIOClient?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        s = SocketIOClient(socketURL: "52.68.0.72:1337/?__sails_io_sdk_version=0.11.0/", options: [.Log(true), .ForcePolling(true)])
//        
//        s?.on("chat message", callback: { (objects: [AnyObject], ack: SocketAckEmitter) -> Void in
//            print(objects)
//            print(ack)
//        })
        s?.on("connect", callback: { (data, ack) -> Void in
            print(data)
        })
    
    
        s?.connect()
        //        s?.emit("post", params)
        

        
    }
    
    @IBAction func hi() {
        let params = [
            "method": "post",
            "headers": [],
            "data": [
                "accessToken": "ce6906b1dd2b73d36c9fb95e41df56bc0df4d2e27510184ed29faff630e916880685723f7c9320f54dfda93e38074b8f724501db268bd996c003ed2da2b37721",
                "friendId": "test-yuntech-student-ca62",
                "userId": "test-yzu-student-f478"
            ],
            "url": "/chatroom/establish_connection"
        ]

        s!.emitWithAck("post", params)(timeoutAfter: 1000, callback: {data in
            print(data)
            print(data.count)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

