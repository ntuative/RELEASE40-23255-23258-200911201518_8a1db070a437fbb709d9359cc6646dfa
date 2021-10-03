package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1722:String;
      
      private var var_553:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_553 = param1;
         var_1722 = param2;
      }
      
      public function get race() : String
      {
         return var_1722;
      }
      
      public function get figure() : String
      {
         return var_553;
      }
   }
}
