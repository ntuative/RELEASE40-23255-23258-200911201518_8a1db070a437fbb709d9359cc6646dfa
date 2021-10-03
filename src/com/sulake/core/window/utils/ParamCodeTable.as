package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["HabboRoomWidgetLib_trophy_bg_silver"] = const_94;
         param1["bound_to_parent_rect"] = const_80;
         param1["child_window"] = const_830;
         param1["embedded_controller"] = const_301;
         param1["resize_to_accommodate_children"] = const_56;
         param1["input_event_processor"] = const_45;
         param1["internal_event_handling"] = const_621;
         param1["mouse_dragging_target"] = const_198;
         param1["mouse_dragging_trigger"] = const_283;
         param1["mouse_scaling_target"] = const_257;
         param1["mouse_scaling_trigger"] = const_398;
         param1["horizontal_mouse_scaling_trigger"] = const_195;
         param1["vertical_mouse_scaling_trigger"] = const_184;
         param1["observe_parent_input_events"] = const_794;
         param1["optimize_region_to_layout_size"] = const_447;
         param1["parent_window"] = const_817;
         param1["relative_horizontal_scale_center"] = const_147;
         param1["relative_horizontal_scale_fixed"] = const_120;
         param1["relative_horizontal_scale_move"] = const_293;
         param1["relative_horizontal_scale_strech"] = const_251;
         param1["relative_scale_center"] = const_890;
         param1["relative_scale_fixed"] = const_562;
         param1["relative_scale_move"] = const_962;
         param1["relative_scale_strech"] = const_847;
         param1["relative_vertical_scale_center"] = const_165;
         param1["relative_vertical_scale_fixed"] = const_103;
         param1["relative_vertical_scale_move"] = const_296;
         param1["relative_vertical_scale_strech"] = const_217;
         param1["on_resize_align_left"] = const_560;
         param1["on_resize_align_right"] = const_365;
         param1["on_resize_align_center"] = const_358;
         param1["on_resize_align_top"] = const_610;
         param1["on_resize_align_bottom"] = const_371;
         param1["on_resize_align_middle"] = const_445;
         param1["on_accommodate_align_left"] = const_894;
         param1["on_accommodate_align_right"] = const_373;
         param1["on_accommodate_align_center"] = const_503;
         param1["on_accommodate_align_top"] = const_978;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_565;
         param1["route_input_events_to_parent"] = const_422;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_807;
         param1["scalable_with_mouse"] = const_924;
         param1["reflect_horizontal_resize_to_parent"] = const_393;
         param1["reflect_vertical_resize_to_parent"] = const_448;
         param1["reflect_resize_to_parent"] = const_231;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
