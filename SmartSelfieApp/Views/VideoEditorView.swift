import SwiftUI

/// 视频编辑界面，展示所有自拍素材并支持调用人脸对齐处理
struct VideoEditorView: View {
    @EnvironmentObject var selfieVM: SelfieViewModel
    
    var body: some View {
        List {
            ForEach(selfieVM.selfies) { selfie in
                HStack {
                    Image(uiImage: selfie.image)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    Text("拍摄: \(selfie.date, formatter: DateFormatter.shortDate)")
                    Spacer()
                    Button("对齐") {
                        // 调用人脸检测与对齐
                        FaceAlignmentManager.detectFace(in: selfie.image) { result in
                            switch result {
                            case .success(let observation):
                                let aligned = FaceAlignmentManager.alignFace(in: selfie.image, using: observation)
                                print("对齐成功")
                                // 实际中更新数据模型显示对齐后的图像
                            case .failure(let error):
                                print("检测失败: \(error.localizedDescription)")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("编辑项目")
    }
}

extension DateFormatter {
    /// 简短日期格式，用于显示拍摄日期
    static var shortDate: DateFormatter {
        let f = DateFormatter()
        f.dateStyle = .short
        return f
    }
}