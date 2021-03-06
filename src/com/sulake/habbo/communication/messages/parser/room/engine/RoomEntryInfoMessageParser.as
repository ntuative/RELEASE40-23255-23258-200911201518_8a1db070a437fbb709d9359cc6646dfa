package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1616:int;
      
      private var var_367:Boolean;
      
      private var var_1615:Boolean;
      
      private var var_723:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1615 = param1.readBoolean();
         if(var_1615)
         {
            var_1616 = param1.readInteger();
            var_367 = param1.readBoolean();
         }
         else
         {
            var_723 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_723 != null)
         {
            var_723.dispose();
            var_723 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_1616;
      }
      
      public function get owner() : Boolean
      {
         return var_367;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_1615;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_723;
      }
   }
}
