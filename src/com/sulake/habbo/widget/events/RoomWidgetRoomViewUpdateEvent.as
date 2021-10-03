package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_578:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_525:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_253:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1421:Point;
      
      private var var_1422:Rectangle;
      
      private var var_199:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1422 = param2;
         var_1421 = param3;
         var_199 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1422 != null)
         {
            return var_1422.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_199;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1421 != null)
         {
            return var_1421.clone();
         }
         return null;
      }
   }
}
