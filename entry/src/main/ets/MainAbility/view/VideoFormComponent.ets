import hilog from '@ohos.hilog';
import { SubtitlePosition, VideoAspect, VideoConcatMode, VideoData } from '../common/bean/VideoData';
import { CommonConstants } from '../common/constants/CommonConstants';

const voiceList = CommonConstants.VOICE_LIST.map(item => {
  return { value: `${item.name}-${item.gender}`, icon: null }
})

hilog.info(0x0000, 'testTag', JSON.stringify(voiceList));

/**
 * Card content contains the information list.
 */
@Component
export struct VideoFormComponent {
  private videoItem: VideoData = new VideoData();

  build() {
    Scroll() {
      Column({ space: 5 }) {
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text($r('app.string.video_subject')).width('100')
          TextInput({placeholder: '请输入视频主题'})
            .type(InputType.Normal)
            .flexShrink(1)
            .backgroundColor('#f5f5f5')
            .onChange(value => {
              this.videoItem.video_subject = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')
        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Start }) {
          Text('视频文案').backgroundColor('#fff')
          TextArea()
            .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
            .height('150')
            .backgroundColor('#f5f5f5')

            .margin({ top: 8 })
            .onChange(value => {
              this.videoItem.video_script = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('200')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Start }) {
          Text('视频关键词').backgroundColor('#fff')
          TextArea()
            .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
            .height('80')
            .backgroundColor('#f5f5f5')
            .margin({ top: 8 })
            .onChange(value => {
              this.videoItem.video_terms = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('130')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('视频拼接模式').width('100')
          Select([{ value: '随机拼接', }, { value: '顺序拼接' }])
            .selected(0)
            .value('随机拼接')
            .flexShrink(1)
            .backgroundColor('#f5f5f5')
            .width('300')
            .onSelect((index, value: VideoConcatMode) => {
              this.videoItem.video_concat_mode = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('视频比例').width('100')
          Select([{ value: '坚屏9:16', }, { value: '横屏16:9' }])
            .selected(0)
            .value('坚屏9:16')
            .flexShrink(1)
            .backgroundColor('#f5f5f5')
            .width('300')
            .onSelect((index, value: VideoAspect) => {
              this.videoItem.video_aspect = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('片段最长(s)').width('100')
          Select([{ value: '2', }, { value: '3' }, { value: '4' }, { value: '5' }, { value: '6' }])
            .selected(1)
            .value('3')
            .flexShrink(1)
            .backgroundColor('#f5f5f5')
            .width('300')
            .onSelect((index, value: String) => {
              this.videoItem.video_clip_duration = Number(value);
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')
        //
        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('朗读声音').width('100')
          Select(voiceList)
            .selected(0)
            .value(voiceList[0].value)
            .flexShrink(1)
            .width('300')
            .backgroundColor('#f5f5f5')
            .padding({ left: 16, right: 26 })
            .onSelect((index, value) => {
              this.videoItem.voice_name = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('朗读音量').width('100')
          Select([{ value: '0.6' }, { value: '0.8' }, { value: '1.0' }, { value: '1.2' }, { value: '1.5' }, {
            value: '2.0'
          }])
            .selected(2)
            .value('1.0')
            .flexShrink(1)
            .width('300')
            .backgroundColor('#f5f5f5')

            .padding({ left: 16, right: 26 })
            .onSelect((index, value) => {
              this.videoItem.voice_volume = Number(value)
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('背景音乐音量').width('100')
          Slider({ min: 0, max: 1, value: 0.2, step: 0.2 })
            .showTips(true)
            .flexShrink(1)
            .width('300vp')
            .padding({ left: 16, right: 26 })
            .onChange((value) => {
              this.videoItem.bgm_volume = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('启用字幕').width('100')
          Checkbox()
            .select(true)
            .flexShrink(1)
            .width('20')
            .height('20')
            .padding({ left: 16, right: 26 })
            .onChange(value => {
              this.videoItem.subtitle_enabled = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('字幕字体').width('100')
          Select([{ value: 'MicrosoftYaHeiBold.ttc' }, { value: 'MicrosoftYaHeiNormal.ttc' }, {
            value: 'STHeitiLight.ttc'
          }, { value: 'STHeitiMedium.ttc' }, { value: 'UTM Kabel KT.ttf' }])
            .selected(1)
            .value('MicrosoftYaHeiNormal.ttc')
            .flexShrink(1)
            .backgroundColor('#f5f5f5')
            .width('300vp')
            .padding({ left: 16, right: 26 })
            .onSelect((index, value) => {
              this.videoItem.font_name = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('字幕位置').width('100')
          Select([{ value: '顶部' }, { value: '中间' }, { value: '底部（推荐）' }])
            .selected(2)
            .value('底部（推荐）')
            .backgroundColor('#f5f5f5')
            .flexShrink(1)
            .width('300vp')
            .padding({ left: 16, right: 26 })
            .onSelect((index) => {
              const value = ['top', 'center', 'bottom'][index] as SubtitlePosition;
              this.videoItem.subtitle_position = value
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('字幕大小').width('100')
          Slider({ min: 30, max: 100, value: 72, step: 1 })
            .showTips(true)
            .flexShrink(1)
            .width('300vp')
            .padding({ left: 16, right: 26 })
            .onChange(value => {
              this.videoItem.font_size = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Text('描边粗细').width('100')
          Slider({ min: 0.0, max: 10.0, value: 1.5, step: 0.01 })
            .showTips(true)
            .flexShrink(1)
            .width('300vp')
            .padding({ left: 16, right: 26 })
            .onChange(value => {
              this.videoItem.stroke_width = value;
            })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

        Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
          Button() {
            Text('生成')
              .width('100%')
              .fontSize('23')
              .fontColor('#ff0ff0')
              .textAlign(TextAlign.Center)
          }
          .type(ButtonType.Capsule)
          .width('100%')
          .height('50')
          .onClick(() => {
            hilog.info(0x0000, 'testTag', JSON.stringify(this.videoItem));

            // TODO: 提交请求，跳转结果查询
          })
        }
        .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
        .height('60')
        .padding({left: 16, right: 16,top: 8, bottom: 8})
        .backgroundColor('#fff')

      }.justifyContent(FlexAlign.Start)

    }
    .scrollable(ScrollDirection.Vertical)
    .width('100%')
    .backgroundColor('#f1f1f1')
    .edgeEffect(EdgeEffect.Spring)
    .margin({ bottom: '56vp' })
  }
}