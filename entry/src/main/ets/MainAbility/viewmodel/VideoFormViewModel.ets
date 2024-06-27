
import hilog from '@ohos.hilog';
import http from '@ohos.net.http';
import { VideoAspect, VideoConcatMode, VideoData } from '../common/bean/VideoData';
export class VideoFormViewModel {
  videoItem: VideoData = this.getDefaultVideoData()
  getDefaultVideoData(){
    const videoItem: VideoData = new VideoData()
    videoItem.video_aspect = VideoAspect.portrait;
    videoItem.video_concat_mode = VideoConcatMode.sequential;
    videoItem.video_clip_duration = 3;
    videoItem.video_count = 1;
    videoItem.voice_name = 'zh-CN-XiaoxiaoNeural-Female'
    videoItem.voice_volume = 1.0
    videoItem.bgm_volume = 0.2
    videoItem.subtitle_enabled = true
    videoItem.font_name = 'MicrosoftYaHeiNormal.ttc'
    videoItem.font_size = 60
    return videoItem;
  }

  submit(){
    hilog.info(0x0000, 'testTag', JSON.stringify(this.videoItem));
    let httpRequest = http.createHttp();
    httpRequest.request('http://127.0.0.1:8080/api/v1/videos', {
      method: http.RequestMethod.POST,
      header: {
        'Content-Type': 'application/json'
      },
      extraData: this.videoItem,
    }, (err, data) =>{
      console.log('request send', err, JSON.stringify(data))
    })
  }
}


const videoFormViewModel = new VideoFormViewModel();

export default videoFormViewModel