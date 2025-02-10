import SwiftUI

/// 跨平台分享管理器，利用系统 UIActivityViewController 实现分享功能
struct ShareManager {
    static func share(items: [Any]) {
        // 获取当前根视图控制器
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootVC = windowScene.windows.first?.rootViewController else { return }
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        rootVC.present(activityVC, animated: true)
    }
}