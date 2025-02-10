import Foundation

/// 发型数据模型，记录发型名称及其他扩展属性
struct Hairstyle: Identifiable {
    let id = UUID()
    let name: String
    // 可添加发型图片、特征向量等属性
}