package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_183:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_1608:Boolean = false;
      
      private var var_1607:int = 0;
      
      private var var_1605:int = 0;
      
      private var var_1606:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_183,param5,param6);
         var_1606 = param1;
         var_1605 = param2;
         var_1607 = param3;
         var_1608 = param4;
      }
      
      public function get pastPeriods() : int
      {
         return var_1607;
      }
      
      public function get periodsLeft() : int
      {
         return var_1605;
      }
      
      public function get daysLeft() : int
      {
         return var_1606;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_1608;
      }
   }
}
