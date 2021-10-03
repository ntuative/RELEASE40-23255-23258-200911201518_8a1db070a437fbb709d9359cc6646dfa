package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_545;
         param1["bitmap"] = const_519;
         param1["border"] = const_711;
         param1["border_notify"] = const_1275;
         param1["button"] = const_344;
         param1["button_thick"] = const_605;
         param1["button_icon"] = const_1185;
         param1["button_group_left"] = const_679;
         param1["button_group_center"] = const_717;
         param1["button_group_right"] = const_602;
         param1["canvas"] = const_590;
         param1["checkbox"] = const_570;
         param1["closebutton"] = const_839;
         param1["container"] = const_292;
         param1["container_button"] = const_627;
         param1["display_object_wrapper"] = const_598;
         param1["dropmenu"] = const_369;
         param1["dropmenu_item"] = const_343;
         param1["frame"] = const_300;
         param1["frame_notify"] = const_1133;
         param1["header"] = const_716;
         param1["icon"] = const_937;
         param1["itemgrid"] = const_888;
         param1["itemgrid_horizontal"] = const_360;
         param1["itemgrid_vertical"] = const_550;
         param1["itemlist"] = const_792;
         param1["itemlist_horizontal"] = const_313;
         param1["itemlist_vertical"] = const_312;
         param1["maximizebox"] = const_1294;
         param1["menu"] = const_1195;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_864;
         param1["minimizebox"] = const_1107;
         param1["notify"] = const_1319;
         param1["HabboRoomWidgetLib_trophy_bg_silver"] = const_428;
         param1["password"] = const_655;
         param1["radiobutton"] = const_573;
         param1["region"] = const_401;
         param1["restorebox"] = const_1281;
         param1["scaler"] = const_898;
         param1["scaler_horizontal"] = const_1327;
         param1["scaler_vertical"] = const_1113;
         param1["scrollbar_horizontal"] = const_380;
         param1["scrollbar_vertical"] = const_670;
         param1["scrollbar_slider_button_up"] = const_788;
         param1["scrollbar_slider_button_down"] = const_938;
         param1["scrollbar_slider_button_left"] = const_843;
         param1["scrollbar_slider_button_right"] = const_958;
         param1["scrollbar_slider_bar_horizontal"] = const_802;
         param1["scrollbar_slider_bar_vertical"] = const_906;
         param1["scrollbar_slider_track_horizontal"] = const_801;
         param1["scrollbar_slider_track_vertical"] = const_805;
         param1["scrollable_itemlist"] = const_1184;
         param1["scrollable_itemlist_vertical"] = const_384;
         param1["scrollable_itemlist_horizontal"] = const_870;
         param1["selector"] = const_687;
         param1["selector_list"] = const_678;
         param1["submenu"] = const_864;
         param1["tab_button"] = const_512;
         param1["tab_container_button"] = const_779;
         param1["tab_context"] = const_465;
         param1["tab_content"] = const_927;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_522;
         param1["input"] = const_582;
         param1["toolbar"] = const_1223;
         param1["tooltip"] = WINDOW_TYPE_TOOLTIP;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
