//
//  ViewState.swift
//  Bol
//
//  Created by Fady Yecob on 10/03/2026.
//

import Foundation

enum ViewState<T> {
    case loading
    case loaded(T)
    case error(Error)
}
