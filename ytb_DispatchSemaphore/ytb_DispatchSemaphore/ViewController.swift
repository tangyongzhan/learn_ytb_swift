//
//  ViewController.swift
//  ytb_DispatchSemaphore
//
//  Created by pm on 2019/4/27.
//  Copyright © 2019 pm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.dispatchSemaphore()
    }
    
    var semaphoreData = [String: Any]()
    
    func dispatchSemaphore(){
        print("dispatchSemaphore")
        let semaphore = DispatchSemaphore(value: 0)
        
        let dispatcQueue = DispatchQueue.global(qos: .background)
        dispatcQueue.async {
            self.fetchSomeUrl(completion: {
                print("request 1")
                semaphore.signal()
            })
            semaphore.wait()
            
            self.fetchSomeUrl(completion: {
                print("request 2")
                semaphore.signal()
            })
            semaphore.wait()
            
            self.fetchSomeUrl(completion: {
                print("request 3")
                semaphore.signal()
            })
            semaphore.wait()
            
            print("need finished 3 request")
        }
    }
    
    
    func normal(){
        fetchSomeUrl {
            print("request 1")
        }
        
        fetchSomeUrl {
            print("request 2")
        }
        
        fetchSomeUrl {
            print("request 3")
        }
        
        print("need finished 3 request")
    }
    
    
    func dispatchGroupFetch(){
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        fetchSomeUrl {
            print("request 1")
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchSomeUrl {
            print("request 2")
            dispatchGroup.leave()
        }
        
        dispatchGroup.enter()
        fetchSomeUrl {
            print("request 3")
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            print("need finished 3 request")
        }
    }
    
    
    func fetchSomeUrl(completion: @escaping ()-> ()){
        guard let url = URL(string: "https:www.baidu.com") else { return }
        URLSession.shared.dataTask(with: url) { (_, _, _ ) in
            completion()
        }.resume()
    }

}

