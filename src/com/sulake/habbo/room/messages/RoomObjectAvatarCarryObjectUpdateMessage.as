package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_975:int;
      
      private var var_1209:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_975 = param1;
         var_1209 = param2;
      }
      
      public function get itemType() : int
      {
         return var_975;
      }
      
      public function get itemName() : String
      {
         return var_1209;
      }
   }
}
