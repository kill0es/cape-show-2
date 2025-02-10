import SwiftUI
import AVKit

/// 视频播放预览界面，利用 AVPlayer 播放生成视频
struct VideoPlayerView: View {
    var url: URL
    var body: some View {
        VideoPlayer(player: AVPlayer(url: url))
            .onDisappear {
                AVPlayer(url: url).pause()
            }
    }
}