//
//  DomainTests.swift
//  DomainTests
//
//  Created by Jordan Capa on 7/17/20.
//  Copyright © 2020 Jordan Capa. All rights reserved.
//

import XCTest
import Domain
class DomainTests: XCTestCase {
    
    var penCoin = Coin(id: "001", code: "PE", country: "Perú", name: "Soles", usdBuy: 3.35, usdSale: 3.35)
    var usdCoin = Coin(id: "002", code: "USD", country: "Estados Unidos", name: "Dólares", usdBuy: 1.00, usdSale: 1.00)
    var jpyCoin = Coin(id: "003", code: "JPY", country: "Japón", name: "Yenes", usdBuy: 107.27, usdSale: 108.27)
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExchangeToUSD() throws {
        let exchangeInteractor = ExchangeInteractor()
        penCoin.value = "3.5"
        XCTAssertEqual(exchangeInteractor.exchange(change: penCoin, to: usdCoin), "1.044776119402985")
    }
    
    func testExchangeFromUSD() throws {
        let exchangeInteractor = ExchangeInteractor()
        usdCoin.value = "1.0"
        XCTAssertEqual(exchangeInteractor.exchange(change: usdCoin, to: penCoin), "3.35")
    }
    
    func testExchangeFromAny() throws {
        let exchangeInteractor = ExchangeInteractor()
        penCoin.value = "10.0"
        XCTAssertEqual(exchangeInteractor.exchange(change: penCoin, to: jpyCoin), "323.19402985074623")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
