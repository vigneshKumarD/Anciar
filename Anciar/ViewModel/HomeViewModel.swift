//
//  HomeViewModel.swift
//  Anciar
//
//  Created by Vignesh Kumar on 5/10/22.
//

import Foundation

class HomeViewModel {
    
    var responseData: [BaseItem] = []
    
    func fetchNumberOfSections() -> Int {
        return responseData.count
    }
    
    func fetchSectionTitle(_ section: Int) -> String {
        return responseData.map{ String($0.sectionTitle)}[section]
    }
    
    func fetchDataForSection(_ section: Int, row: Int) -> Items? {
        return responseData[section].items[row]
    }
    
    func fetchNumberOfRowsPerSection(_ section: Int) -> Int? {
        return responseData[section].items.count
    }
    
    func fetchData(completionHandler: ((Error?) -> ())? = nil) {
        DispatchQueue.global().async {[weak self] in
            for section in 1...10 {
                var result: [Items] = [Items]()
                for index in 0...4 {
                    if index % 2 == 0 {
                        result.append(Items(firstImageUrl: ImageList.images.randomElement(), secondImageUrl: ImageList.images.randomElement()))
                    } else {
                        result.append(Items(firstImageUrl: ImageList.images.randomElement()))
                    }
                }
                self?.responseData.append(BaseItem(items: result, sectionTitle: "Section \(section)"))
            }
            DispatchQueue.main.async {
                completionHandler?(nil)
            }
        }
    }
}

