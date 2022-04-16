//
//  WebServiceController.swift
//  WeatherApp
//
//  Created by Omar Ahmed on 16/04/2022.
//

import Foundation

public protocol WebServiceController {
    func fetchWeatherData(for city: String,
                          completionHandler: @escaping(String?, WebServiceControllerError?) -> Void)
}

// MARK: - WebServiceControllerError
public enum WebServiceControllerError: Error {
    case invalidURL(String)
    case invalidPayload(URL)
    case forwarded(Error)
}
