package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenConnectionMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var var_1804:int;
      
      private var var_1803:Boolean;
      
      public function OpenConnectionMessageComposer(param1:Boolean, param2:int, param3:int = 0)
      {
         super();
         _roomId = param2;
         var_1803 = param1;
         var_1804 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [int(var_1803),_roomId,var_1804];
      }
      
      public function dispose() : void
      {
      }
   }
}
