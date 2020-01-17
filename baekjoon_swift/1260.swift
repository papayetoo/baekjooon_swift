//
//  1260.swift
//  baekjonn_swift
//
//  Created by 최광현 on 2020/01/17.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

func dfs(Array: [[Int]], Visited: inout [Bool], Current:Int) -> Void {
    print(Current + 1, separator: "", terminator: " ")
    let arr : [Int] = Array[Current]
    var index : Int = 0
    repeat{
        let next : Int = arr[index]
        if !Visited[next] {
            Visited[next] = true
            dfs(Array: Array, Visited: &Visited, Current: next)
        }
        index += 1
    } while index < arr.count
}

func bfs(Array: [[Int]], Visited: inout [Bool], Current:Int) -> Void{
    
    var q : [Int] = [Int]()
    
    q.append(Current)
    repeat{
        let front = q.removeFirst()
        let arr : [Int] = Array[front]
        print(front + 1, separator: "", terminator: " ")
        for i in 0..<arr.count{
            if !Visited[arr[i]] {
                Visited[arr[i]] = true
                q.append(arr[i])
            }
        }
    }while !q.isEmpty
    
}

func solution_1260(){
    var n : Int = 0
    var m : Int = 0
    var v : Int = 0

    if let input : String = readLine(){
        let firstline : [String] = input.components(separatedBy: " ")
        n = Int(firstline[0])!
        m = Int(firstline[1])!
        v = Int(firstline[2])!
    }

    var adjList : [ [Int] ] = [[Int]](repeating: [], count: n)
    var visited : [Bool] = [Bool](repeating: false, count: n)

    for _ in 0..<m{
        
        if let edges : String = readLine(){
            let nodes : [String] = edges.components(separatedBy: " ")
            let u = Int(nodes[0])! - 1
            let v = Int(nodes[1])! - 1
            
            adjList[u].append(v)
            adjList[v].append(u)
        }
    }

    for i in 0..<n{
        adjList[i].sort(by: <)
    }

    visited[v - 1] = true
    dfs(Array: adjList, Visited: &visited, Current: v - 1)
    print()
    for i in 0..<n{
        visited[i] = false
    }
    visited[v - 1] = true
    bfs(Array: adjList, Visited: &visited, Current: v - 1)
}
