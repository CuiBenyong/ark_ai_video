import hilog from '@ohos.hilog';
import { CommonConstants } from '../common/constants/CommonConstants';

/**
 * Card content contains the information list.
 */
@Component
export struct VideoFormComponent {
  build() {
    Column() {
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text($r('app.string.video_subject')).width('100')
        TextInput()
          .type(InputType.Normal)
          .backgroundColor('#ff0')
          .flexShrink(1)
      }
      .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
      .height('60')
      .padding('16')
      .backgroundColor('#f00')

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Start }) {
        Text($r('app.string.video_subject')).backgroundColor('#f00')
        TextArea()
          .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
          .height('150')
          .margin({top: 8})
      }
      .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
      .height('200')
      .padding('16')
      .backgroundColor('#f0f')

      Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Start, alignItems: ItemAlign.Start }) {
        Text($r('app.string.video_subject')).backgroundColor('#f00')
        TextArea()
          .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
          .height('150')
          .margin({top: 8})
      }
      .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
      .height('200')
      .padding('16')
      .backgroundColor('#ff0')

      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text($r('app.string.video_subject')).width('100')
        Select([{value: ''}])
      }
      .width(CommonConstants.DETAIL_PAGE_WIDTH_PERCENT)
      .height('60')
      .padding('16')
      .backgroundColor('#0f0')

    }.height(CommonConstants.DETAIL_PAGE_HEIGHT_PERCENT)


  }
}