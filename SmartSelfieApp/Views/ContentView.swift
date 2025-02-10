import SwiftUI

/// 主界面入口，提供生成视频、编辑项目、发型定制、上传管理和分享入口
struct ContentView: View {
    @EnvironmentObject var selfieVM: SelfieViewModel
    @EnvironmentObject var projectVM: VideoProjectViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Button("生成视频") {
                    // 使用所有自拍和默认风格创建视频项目
                    projectVM.createProject(with: selfieVM.selfies, style: .timelapse)
                    if let project = projectVM.currentProject {
                        VideoEditorManager.composeVideo(with: project.selfies, style: project.style) { result in
                            switch result {
                            case .success(let url):
                                print("视频生成成功: \(url)")
                            case .failure(let error):
                                print("视频生成失败: \(error.localizedDescription)")
                            }
                        }
                    }
                }
                NavigationLink("编辑项目", destination: VideoEditorView())
                NavigationLink("发型定制", destination: HairstyleCustomizationView())
                NavigationLink("上传管理", destination: UploadView())
                Button("分享视频") {
                    // 示例：分享生成的视频（实际中应传入项目中实际视频 URL）
                    let url = RenderSettings().outputURL
                    ShareManager.share(items: [url])
                }
            }
            .navigationTitle("智能自拍集")
        }
    }
}