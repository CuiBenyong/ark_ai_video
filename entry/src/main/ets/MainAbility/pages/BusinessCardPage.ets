import router from '@ohos.router';
import hilog from '@ohos.hilog';
import type { TabItemData } from '../common/bean/TabItemData';
import { CommonConstants } from '../common/constants/CommonConstants';
import { CardContentComponent } from '../view/CardContentComponent';
import BusinessViewModel from '../viewmodel/BusinessViewModel';
import { VideoFormComponent } from '../view/VideoFormComponent';

/**
 * This template implements the business card function and consists of three components.The top part is the
 * title, and the bottom part is the Tab. The middle card content shows the business information.
 * Developers can enrich the function of title and Tab, and add relevant business information to the list.
 */
@Entry
@Component
struct BusinessCardPage {
  @State currentIndex: number = 0;
  @State breakPoint: string = CommonConstants.BREAK_POINT_XS;

  build() {

    Column() {
      Tabs({
        index: this.currentIndex,
        barPosition: this.breakPoint === CommonConstants.BREAK_POINT_LG ? BarPosition.Start : BarPosition.End
      }) {
        ForEach(BusinessViewModel.getTabItems(), (item: TabItemData) => {
          TabContent() {
            Column() {
              this.Title()

              if(this.currentIndex == 1){
                CardContentComponent({ currentPoint: $breakPoint })
              }else{
                VideoFormComponent()
              }
            }
          }
          .tabBar(this.CardTab(item))
        }, (item, index) => index + JSON.stringify(item))
      }
      .vertical(this.breakPoint === CommonConstants.BREAK_POINT_LG)
      .barWidth(this.breakPoint === CommonConstants.BREAK_POINT_LG ?
        $r('app.float.bar_width') : CommonConstants.TAB_BAR_HEIGHT_PERCENT)
      .barHeight(this.breakPoint === CommonConstants.BREAK_POINT_LG ?
        CommonConstants.TAB_HEIGHT_PERCENT : $r('app.float.bar_height'))
      .layoutWeight(CommonConstants.TABS_WEIGHT)
      .barMode(BarMode.Fixed)
      .align(Alignment.Center)
      .onChange((index: number) => {
        this.currentIndex = index;
      })
    }
    .backgroundColor($r('app.color.common_background'))
    .height('100%')
  }

  @Builder CardTab(item: TabItemData) {
    Column() {
      Image(this.currentIndex === item.index ? item.imageActivated : item.imageOriginal)
        .width($r('app.float.tab_title_image'))
        .height($r('app.float.tab_title_image'))
        .objectFit(ImageFit.Contain)
        .margin({
          top: $r('app.float.tab_image_margin_top'),
          bottom: $r('app.float.tab_image_margin_bottom')
        })
      Text(item.title)
        .fontSize($r('app.float.tab_text_size'))
        .fontColor(this.currentIndex === item.index ?
          $r('app.color.tab_text_activated') : $r('app.color.tab_text_normal'))
    }
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.TAB_BAR_WIDTH_PERCENT)
    .height(CommonConstants.TAB_BAR_HEIGHT_PERCENT)
  }

  @Builder Title() {
    Row() {

      Text(this.currentIndex === 0 ? $r('app.string.tab_home') : $r('app.string.tab_mine'))
        .fontSize($r('app.float.tab_title_size'))
        .fontColor($r('app.color.title'))
        .fontWeight(CommonConstants.TITLE_FONT_WEIGHT)
    }
    .width(CommonConstants.FULL_WIDTH_PERCENT)
    .height($r('app.float.title_height'))
    .justifyContent(FlexAlign.Center)
  }
}