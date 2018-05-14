//
//  testReactor.swift
//  IOS-ReactorKit
//
//  Created by HengVisal on 5/13/18.
//  Copyright © 2018 HengVisal. All rights reserved.
//

import ReactorKit
import RxSwift

final class testReactor : Reactor{
    enum Action {
        case increase
    }
    
    enum Mutation {
        case increaseValue
    }
    
    struct State {
        var value : Int = 0
    }
    let initialState: State = State()
    
    func mutate(action: testReactor.Action) -> Observable<String> {
        switch action {
        case .increase:
            return Observable.just("increaseValue")
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var testState = state
        switch mutation {
        case .increaseValue:
            testState.value = testState.value + 1
        }
        
        
        return testState
    }
}
