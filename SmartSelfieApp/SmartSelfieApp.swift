import SwiftUI

/// 应用入口，设置环境对象供各界面共享数据
@main
struct SmartSelfieApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(SelfieViewModel())          // 注入自拍素材 ViewModel
                .environmentObject(VideoProjectViewModel())        // 注入视频项目 ViewModel
                .environmentObject(HairstyleViewModel())           // 注入发型定制 ViewModel
        }
    }
}