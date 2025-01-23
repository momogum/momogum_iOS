//
//  AppointViewModel.swift
//  momogum
//
//  Created by nelime on 1/23/25.
//

import Foundation

class AppointViewModel {
    
    var appoints: [Appoint] = [Appoint.DUMMY_APM, Appoint.DUMMY_APM, Appoint.DUMMY_APM, Appoint.DUMMY_APM]
    
    init() {
        Task {
            await loadAllAppoints()
        }
    }
    
    
    func loadAllAppoints() async {
//        do {
//            let documents = try await Firestore.firestore().collection("posts").order(by: "date", descending: true).getDocuments().documents
//            
//            let appoints = try documents.map({ document in
//                return try document.data(as: Appoint.self)
//            })
//            self.appoints = appoints
//            
//        } catch {
//            print("DEBUG : Failed to load appoints with error \(error.localizedDescription)")
//        }
    }
}
