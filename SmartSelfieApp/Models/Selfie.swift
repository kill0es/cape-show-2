import UIKit

/// 自拍数据模型，记录拍摄的图片及时间
struct Selfie: Identifiable {
    let id = UUID()
    let image: UIImage
    let date: Date
}