package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1988:String;
      
      private var var_366:int;
      
      private var var_1987:String;
      
      private var var_1992:String;
      
      private var var_1989:int;
      
      private var var_1990:String;
      
      private var var_1991:int;
      
      private var var_573:Array;
      
      private var var_996:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_573 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_996 = false;
            return;
         }
         this.var_996 = true;
         var_1989 = int(_loc2_);
         var_1987 = param1.readString();
         var_366 = int(param1.readString());
         var_1991 = param1.readInteger();
         var_1988 = param1.readString();
         var_1992 = param1.readString();
         var_1990 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_573.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_1991;
      }
      
      public function get eventName() : String
      {
         return var_1988;
      }
      
      public function get eventDescription() : String
      {
         return var_1992;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_1987;
      }
      
      public function get tags() : Array
      {
         return var_573;
      }
      
      public function get creationTime() : String
      {
         return var_1990;
      }
      
      public function get exists() : Boolean
      {
         return var_996;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_1989;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_573 = null;
      }
      
      public function get flatId() : int
      {
         return var_366;
      }
   }
}
