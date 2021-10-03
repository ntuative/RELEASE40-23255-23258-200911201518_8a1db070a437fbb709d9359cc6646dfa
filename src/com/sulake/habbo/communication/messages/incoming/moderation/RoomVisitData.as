package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_654:String;
      
      private var var_1888:int;
      
      private var var_1490:Boolean;
      
      private var _roomId:int;
      
      private var var_1887:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1490 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_654 = param1.readString();
         var_1887 = param1.readInteger();
         var_1888 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1490;
      }
      
      public function get roomName() : String
      {
         return var_654;
      }
      
      public function get enterMinute() : int
      {
         return var_1888;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_1887;
      }
   }
}
