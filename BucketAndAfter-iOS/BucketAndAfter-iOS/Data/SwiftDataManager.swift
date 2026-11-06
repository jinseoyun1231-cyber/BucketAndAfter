//
//  SwiftDataManager.swift
//  BucketAndAfter-iOS
//
//  Created by Seoyun Jin on 11/2/26.
//

import Foundation
import SwiftData

let Container: ModelContainer = {
    do {
        return try ModelContainer(for: BucketInfo.self)
    } catch {
        fatalError("컨테이너 생성 실패: \(error)")
    }
}()
