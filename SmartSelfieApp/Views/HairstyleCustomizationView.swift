import SwiftUI

/// 发型定制界面，支持输入文本描述、模糊搜索推荐、生成发型效果及推理过程展示
struct HairstyleCustomizationView: View {
    @EnvironmentObject var hairstyleVM: HairstyleViewModel
    @State private var descriptionText: String = ""
    @State private var resultImage: UIImage? = nil
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("请输入发型描述", text: $descriptionText, onCommit: {
                hairstyleVM.search(query: descriptionText)
            })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if !hairstyleVM.searchResults.isEmpty {
                Text("推荐发型: \(hairstyleVM.searchResults.map { $0.name }.joined(separator: ", "))")
                    .padding()
            }
            
            Button("生成发型") {
                // 示例中使用系统图标代替真实自拍
                let sampleImage = UIImage(systemName: "person.crop.circle")!
                hairstyleVM.customizeHairstyle(for: sampleImage, with: descriptionText) { result in
                    switch result {
                    case .success(let image):
                        resultImage = image
                    case .failure(let error):
                        print("定制失败: \(error.localizedDescription)")
                    }
                }
            }
            
            if let image = resultImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
            
            if !descriptionText.isEmpty {
                Text("推理过程: \(hairstyleVM.getInferenceDetails(for: descriptionText))")
                    .padding()
            }
            
            Spacer()
        }
        .navigationTitle("发型定制")
        .padding()
    }
}