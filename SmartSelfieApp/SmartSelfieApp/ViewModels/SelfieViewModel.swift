import Foundation
import SwiftUI

/// 管理自拍素材采集与存储的 ViewModel
class SelfieViewModel: ObservableObject {
    @Published var selfies: [Selfie] = []
    
    init() {
        loadSelfies()
    }
    
    /// 加载自拍素材（实际中可从 Core Data 或文件系统加载）
    func loadSelfies() {
        selfies = []  // 示例中为空数组
    }
    
    /// 添加新自拍
    func addSelfie(_ selfie: Selfie) {
        selfies.append(selfie)
    }
}