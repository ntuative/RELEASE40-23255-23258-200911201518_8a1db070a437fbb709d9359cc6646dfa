package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_114:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1563:int;
      
      private var var_366:int;
      
      private var var_578:RoomData;
      
      private var var_1589:int;
      
      private var _ownerName:String;
      
      private var var_1672:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_366 = param1.readInteger();
         var_1563 = param1.readInteger();
         var_1672 = param1.readBoolean();
         var_1589 = param1.readInteger();
         _ownerName = param1.readString();
         var_114 = new RoomData(param1);
         var_578 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1563;
      }
      
      public function get event() : RoomData
      {
         return var_578;
      }
      
      public function get room() : RoomData
      {
         return var_114;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_114 != null)
         {
            var_114.dispose();
            var_114 = null;
         }
         if(var_578 != null)
         {
            var_578.dispose();
            var_578 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_366;
      }
      
      public function get ownerId() : int
      {
         return var_1589;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1672;
      }
   }
}
