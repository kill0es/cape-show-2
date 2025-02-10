import UIKit

/// 自动采集自拍管理器，支持与 iOS 捷径联动实现后台自动采集自拍
class AutoSelfieManager {
    static let shared = AutoSelfieManager()
    
    /// 由系统捷径调用，将传入的图片封装为 Selfie 对象
    func captureSelfie(image: UIImage) {
        let selfie = Selfie(image: image, date: Date())
        // 实际项目中应将 selfie 添加到 SelfieViewModel 中（例如通过通知或依赖注入）
        print("自动采集自拍: \(selfie)")
    }
}