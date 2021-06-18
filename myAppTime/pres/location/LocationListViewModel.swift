//
//  LocationListViewModel.swift
//  myAppTime
//
//  Created by Edwin Alberto Chuchón Alva on 2/6/21.
//

import Foundation
import Combine
import SwiftUI

class LocationListViewModel: ObservableObject {
    
    private var cancelables = Set<AnyCancellable>()
    
    private var locationUseCase: LocationUseCase
    
    @Published var searchText: String = String()
    
    @Published var locations: [LocationViewModel] = []
    
    @Published var locationsFound: [LocationViewModel] = []
    
    
    
    init() {
        
        locationUseCase = LocationUseCaseImpl()
        
        $searchText
            .debounce(for: .milliseconds(800), scheduler: RunLoop.main) // debounces the string publisher, such that it delays the process of sending request to remote server.
            .removeDuplicates()
            .map({ (string) -> String? in
                if string.count < 1 {
                    self.locations = []
                    return nil
                }
                
                return string
            }) // prevents sending numerous requests and sends nil if the count of the characters is less than 1.
            .compactMap { $0 } // removes the nil values so the search string does not get passed down to the publisher chain
            .sink { (_) in
                //
            } receiveValue: { [self] (searchField) in
                searchItems(searchText: searchField)
            }.store(in: &cancelables)
    }
    
    
    
    //obtener todos los datos
    func fecthLocation(nameCity: String) {
        // devuelve --> [LocationCitiesModelDomain]
        locationUseCase.getLocation(nameCity: nameCity)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .map { result in
                result.map { item in
                    return LocationViewModel(location: item)
                }
            }.catch { error -> AnyPublisher<[LocationViewModel], Never> in
                return Empty(completeImmediately: true).eraseToAnyPublisher()
                
            }.assign(to: \.locations, on: self)
            .store(in: &cancelables)
        
    }
    
    private func searchItems(searchText:String) {
        
        print(searchText)
        print("searchItems: \(locationUseCase.getLocation(nameCity: searchText))")
        //devuelve --> [LocationCitiesModelDomain]
        locationUseCase.getLocation(nameCity: searchText)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .map { result in
                //print(result)
                return result.map { item in
                    print("Este es tu item: \(item)")
                    //item == LocationCitiesModelDomain
                    return LocationViewModel(location: item)
                }
            }.catch { error -> AnyPublisher<[LocationViewModel], Never> in
                return Empty(completeImmediately: true).eraseToAnyPublisher()
                
            }.assign(to: \.locationsFound, on: self)
            .store(in: &cancelables)
        print("locationsFound count: \(locationsFound.count)")
    }
    
    
    
    
    
    
}
