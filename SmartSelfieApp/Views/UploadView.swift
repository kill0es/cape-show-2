import SwiftUI

/// 视频上传管理界面，支持选择上传平台及全自动上传
struct UploadView: View {
    @State private var selectedPlatform: VideoPlatform = .youtube
    @State private var uploadStatus: String = ""
    // 此处假定当前视频为 RenderSettings 输出文件，实际中应从视频项目获取真实 URL
    var videoURL: URL { RenderSettings().outputURL }
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("选择上传平台", selection: $selectedPlatform) {
                ForEach(VideoPlatform.allCases, id: \.self) { platform in
                    Text(platform.rawValue).tag(platform)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Button("上传视频") {
                uploadStatus = "上传中..."
                UploadManager.shared.uploadVideo(videoURL: videoURL, to: selectedPlatform) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            uploadStatus = "上传成功至 \(selectedPlatform.rawValue)"
                        case .failure(let error):
                            uploadStatus = "上传失败: \(error.localizedDescription)"
                        }
                    }
                }
            }
            
            Button("全自动上传所有平台") {
                uploadStatus = "全自动上传中..."
                UploadManager.shared.autoUpload(videoURL: videoURL) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success:
                            uploadStatus = "全自动上传成功"
                        case .failure(let error):
                            uploadStatus = "上传失败: \(error.localizedDescription)"
                        }
                    }
                }
            }
            
            Text(uploadStatus)
                .padding()
            
            Spacer()
        }
        .navigationTitle("上传管理")
    }
}