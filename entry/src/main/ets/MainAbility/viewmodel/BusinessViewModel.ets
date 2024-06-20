import { TabItemData } from '../common/bean/TabItemData';
import { ListItemData } from '../common/bean/ListItemData';
import { CommonConstants } from '../common/constants/CommonConstants';
import { WidgetType } from '../common/bean/WidgetType';

/**
 * BusinessCard ability view model.
 */
class BusinessViewModel {
  /**
   * Get list items.
   *
   * @return {Array<ListItemData>} listItems.
   */
  getListItems(): Array<ListItemData> {
    let widgets: Array<WidgetType> = [WidgetType.TOGGLE, WidgetType.INFO, WidgetType.TEXT, WidgetType.default];
    let listItems: Array<ListItemData> = [];
    for (let i = 0; i < widgets.length; i++) {
      for (let j = 0; j < CommonConstants.REPEAT_TIMES; j++) {
        let cardItem = new ListItemData();
        cardItem.title = $r('app.string.list_item_title');
        cardItem.subTitle = $r('app.string.list_item_sub_title');
        cardItem.widget = widgets[i];
        listItems.push(cardItem);
      }
    }
    return listItems;
  }

  /**
   * Get tab items of businessCard page.
   *
   * @return {Array<TabItemData>} tabItems.
   */
  getTabItems(): Array<TabItemData> {
    let tabItems: Array<TabItemData> = [];
    let tabHome = new TabItemData();
    tabHome.index = 0;
    tabHome.imageOriginal = $r('app.media.ic_tab_normal');
    tabHome.imageActivated = $r('app.media.ic_tab_activated');
    tabHome.title = $r('app.string.tab_home');
    tabItems.push(tabHome);

    let tabMine = new TabItemData();
    tabMine.index = 1;
    tabMine.imageOriginal = $r('app.media.ic_tab_normal');
    tabMine.imageActivated = $r('app.media.ic_tab_activated');
    tabMine.title = $r('app.string.tab_mine');
    tabItems.push(tabMine);
    return tabItems;
  }

  /**
   * Get detail page list items.
   *
   * @return {Array<ListItemData>} detailListItems.
   */
  getDetailPageListItems(): Array<ListItemData> {
    let detailListItems: Array<ListItemData> = [];
    for (let i = 0; i < CommonConstants.DETAIL_LIST_SIZE; i++) {
      let listItem = new ListItemData();
      listItem.title = $r('app.string.list_item_title');
      listItem.subTitle = $r('app.string.list_item_sub_title');
      detailListItems.push(listItem);
    }
    return detailListItems;
  }
}

let businessViewModel = new BusinessViewModel();

export default businessViewModel as BusinessViewModel;