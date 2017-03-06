//
//  ViewController.swift
//  photon
//
//  Created by Sneha Nemaragomula on 3/3/17.
//  Copyright © 2017 Sneha Nemaragomula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let A =  [ ["3" ,"4" ,"1", "2", "8", "6"],
                   ["6", "1", "8" ,"2" ,"7", "4"],
                   ["5", "9" ,"3" ,"9" ,"9", "5"],
                   ["8", "4", "1", "3", "k", "6"],
                   ["3", "7", "2", "8", "6", "4"]
        ];
//        A = [[19, 10, 19, 10, 19],
//             [21, 23, 20, 19, 12],
//             [20, 12, 20, 11, 10]]
//        
//        A = [[5,8,5,3,5]]
//        //
//        A = [[5],
//             [8],
//             [5],
//             [3],
//             [5]]
        //        A = [[69, 10, 19, 10, 19],
        //             [51, 23, 20, 19, 12],
        //             [60, 12, 20, 11, 10]]
        //

        print(findPath(A))
    }
    
    func findPath(A:[[String]]) ->(sucess : Bool,Cost: Int, path : [Int],reason : String)  {
        
        var Track = [Int]()

        if A.count == 0  {
            return (false,0,Track,"Invalid Matrix")
        }
        if A[0].count == 0  {
            return (false,0,Track,"Invalid Matrix")
        }

        guard let firstN = Int(A[0][0]) else{
            return (false,0,Track,"Invalid Matrix")
        }
        var count  = firstN
        var indexInt = 0
        var i = 0
        var temp:Int = 0

        while i < A.count {
            let innerArr = A[i]
            temp = 0
            print(innerArr)
            var repeatB = false
            for j in indexInt..<innerArr.count {
                if j+1 < innerArr.count {
                    if i+1<A.count {
                        print(A[i+1][j+1],"-",innerArr[j+1])
                        guard let nxt = Int(A[i+1][j+1] ) else{
                            return (false,0,Track,"Invalid Matrix")
                        }
                        guard let detailnxt = Int(innerArr[j+1] ) else{
                            return (false,0,Track,"Invalid Matrix")

                        }

                        temp +=  min(nxt, detailnxt)
                        print(temp)
                        Track.append(i+1)
                        if detailnxt <= nxt  {
//                            i -= 1
                            repeatB = true
                        }

                        indexInt = j + 1
                        break
                    }else{
                        print("outOfboubd",Track)
                        guard let nxt = Int(A[i][j+1]) else{
                            return (false,0,Track,"Invalid Matrix")
                        }
                        guard let detailnxt = Int(innerArr[j+1] ) else{
                            return (false,0,Track,"Invalid Matrix")
                            
                        }
                        

                        temp +=  min(nxt, detailnxt)
                        Track.append(i+1)
                        if detailnxt <= nxt  {
                            //                            i -= 1
                            repeatB = true
                        }
                        indexInt = j + 1
                    }
                }else{
                    
//                    if i+1<=A.count {
////                        temp +=  min(A[i][j], innerArr[j])
//                        temp = min(temp, innerArr[j])
//                        Track.append(i+1)
//                        
//                    }else{
//                        temp = min(A[i+1][j], innerArr[j])
//                      Track.append(i+1)
//                    }
//                    if i+1 != A.count {
////                    temp +=  min(A[i][j], innerArr[j])
//                    }
             //       temp +=  min(A[i][j], innerArr[j])

                    Track.append(i+1)

                    indexInt = j
                    
                }
            }
            if count + temp > 50 {
                print(count)
                print(Track)
                return (false,count,Track,"cost more then 50")

            }
            count += temp
            print(count)

            if repeatB == false || i+1 == A.count {
            i += 1
            }
            
        }
        print(count)
        print(Track)
        return (true,count,Track,"valid")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

