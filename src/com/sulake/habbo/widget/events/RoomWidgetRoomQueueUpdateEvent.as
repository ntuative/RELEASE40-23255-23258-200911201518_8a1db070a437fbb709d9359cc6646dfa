package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_426:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_297:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_830:int;
      
      private var var_261:Boolean;
      
      private var var_1993:Boolean;
      
      private var var_1333:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_830 = param2;
         var_1993 = param3;
         var_261 = param4;
         var_1333 = param5;
      }
      
      public function get position() : int
      {
         return var_830;
      }
      
      public function get isActive() : Boolean
      {
         return var_261;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1333;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1993;
      }
   }
}
