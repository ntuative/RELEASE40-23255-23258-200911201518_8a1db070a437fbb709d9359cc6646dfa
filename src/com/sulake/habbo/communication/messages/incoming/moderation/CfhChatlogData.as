package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_974:int;
      
      private var var_1910:int;
      
      private var var_1407:int;
      
      private var var_114:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1407 = param1.readInteger();
         var_1910 = param1.readInteger();
         var_974 = param1.readInteger();
         var_114 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1407);
      }
      
      public function get reportedUserId() : int
      {
         return var_974;
      }
      
      public function get callerUserId() : int
      {
         return var_1910;
      }
      
      public function get callId() : int
      {
         return var_1407;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_114;
      }
   }
}
