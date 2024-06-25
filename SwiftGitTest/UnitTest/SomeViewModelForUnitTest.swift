//
//  SomeViewModelForUnitTest.swift
//  SwiftGitTest
//
//  Created by MyBook on 15.06.2024.
//

import Foundation
import Combine

class SomeViewModelForUnitTest: ObservableObject {
    @Published var isPremium: Bool
    @Published var selected: String? = nil
    @Published var arrayData: [String] = []
    
    var cancellables = Set<AnyCancellable>()
    
    var manager: MockDataManager
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
        manager = MockDataManager(dataArray: nil)
    }
    
    enum CustomError: Error {
        case doesntExist
        case noData
    }
    
}

//MARK: - UserIntent(s)
extension SomeViewModelForUnitTest {
    
    func addElement(_ item: String) {
        guard !item.isEmpty else { return }
        
        arrayData.append(item)
    }
    
    func selectElement(_ item: String) {
        if let item = arrayData.first(where: { $0 == item }) {
            selected = item
        } else {
            selected = nil
        }
    }
    
    func saveElement(_ item: String) throws {
        
        if item == "" {
            throw CustomError.noData
        }
        
        guard let element = arrayData.first(where: { $0 == item }) else {
            throw CustomError.doesntExist
        }
        
        //code for save
    }
    
    func getDataWithEscaping() {
        manager.dataFromEscaping { [weak self] array in
            self?.arrayData = array
        }
    }
    
    func getDataWithCompine() {
        manager.dataFromCombine()
            .receive(on: DispatchQueue.main)
            .sink { _ in
                //
            } receiveValue: { [weak self] array in
                self?.arrayData = array
            }
            .store(in: &cancellables)

    }
    
    func getDataWithAsync() {
        Task {
            let result = await manager.dataFromConcurrency()
            await MainActor.run {
                self.arrayData = result
            }
        }
    }
}
