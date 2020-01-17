//
//  11724.swift
//  baekjonn_swift
//
//  Created by 최광현 on 2020/01/17.
//  Copyright © 2020 최광현. All rights reserved.
//

import Foundation

func dfs(Visited: inout [Bool], Adjs: [[Int]], Current: Int){
    
    //이중 배열로 구현한 인접리스트
    let curAdjs : [Int] = Adjs[Current]
    for i in 0..<curAdjs.count {
        if !Visited[curAdjs[i]] {
            Visited[curAdjs[i]] = true
            dfs(Visited: &Visited, Adjs: Adjs, Current: curAdjs[i])
        }
    }
}

func bfs(Visited: inout [Bool], Adjs: [[Int]], Current: Int){
    
    var queue : [Int] = [Int]()
    //배열로 구현한 큐.
    queue.append(Current)
    //큐에 푸쉬
    repeat{
        //큐에서 front를 pop하고
        //해당 인접리스트에서 Visted[frontAdjs[i]] == false 인 frontAdjs[i]를
        //찾아 큐에 집어 넣음.
        var front : Int = queue.removeFirst()
        var frontAdjs : [Int] = Adjs[front]
        for i in 0..<frontAdjs.count{
            if !Visited[frontAdjs[i]] {
                Visited[frontAdjs[i]] = true
                queue.append(frontAdjs[i])
            }
        }
    } while !queue.isEmpty
    
}

func solution_11724()->Void{
    
    var n : Int = 0
    var e : Int = 0
    
    
    if let firstLine : String = readLine() {
        let inputs : [String] = firstLine.components(separatedBy: " ")
        if let firstA = Int(inputs[0]){
            n = firstA
        }

        if let firstB = Int(inputs[1]){
            e = firstB
        }
    }
    
    
    var adjLists : [[Int]] = [[Int]].init(repeating: [], count: n + 1)
    var visited : [Bool] = [Bool].init(repeating: false, count: n + 1)
    // 이중 배열로 구현된 인접리스트와 배열로 구현한 visted
    // 인덱스를 1부터 사용하기 위해 n + 1 개 선언.
    
    for _ in 0..<e{
        if let edgeInputs : String = readLine(){
            let nodes : [String] = edgeInputs.components(separatedBy: " ")
            
            let u : Int = Int(nodes[0])!
            let v : Int = Int(nodes[1])!
            
            adjLists[u].append(v)
            adjLists[v].append(u)
        }
    }
    
    var count = 0
    for i in 1...n{
        if(!visited[i]){
            visited[i] = true;
            dfs(Visited: &visited, Adjs: adjLists, Current: i)
            print()
            count += 1
        }
    }
    print(count)
}
