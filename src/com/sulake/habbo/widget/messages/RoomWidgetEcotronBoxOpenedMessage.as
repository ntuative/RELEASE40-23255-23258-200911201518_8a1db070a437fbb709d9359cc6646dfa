package com.sulake.habbo.widget.messages
{
   public class RoomWidgetEcotronBoxOpenedMessage extends RoomWidgetMessage
   {
      
      public static const const_1251:String = "RWEBOM_ECOTRONBOX_OPENED";
       
      
      private var var_1145:int;
      
      private var var_975:String;
      
      public function RoomWidgetEcotronBoxOpenedMessage(param1:String, param2:String, param3:int)
      {
         super(param1);
         var_975 = param2;
         var_1145 = param3;
      }
      
      public function get classId() : int
      {
         return var_1145;
      }
      
      public function get itemType() : String
      {
         return var_975;
      }
   }
}
