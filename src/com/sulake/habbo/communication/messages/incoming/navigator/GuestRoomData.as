package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1563:int;
      
      private var var_2095:String;
      
      private var var_2099:int;
      
      private var var_2098:int;
      
      private var var_578:Boolean;
      
      private var var_1808:Boolean;
      
      private var var_366:int;
      
      private var var_1110:String;
      
      private var var_1731:int;
      
      private var var_1111:int;
      
      private var _ownerName:String;
      
      private var var_654:String;
      
      private var var_2096:int;
      
      private var var_2097:RoomThumbnailData;
      
      private var var_1728:Boolean;
      
      private var var_573:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_573 = new Array();
         super();
         var_366 = param1.readInteger();
         var_578 = param1.readBoolean();
         var_654 = param1.readString();
         _ownerName = param1.readString();
         var_1731 = param1.readInteger();
         var_1563 = param1.readInteger();
         var_2096 = param1.readInteger();
         var_1110 = param1.readString();
         var_2099 = param1.readInteger();
         var_1728 = param1.readBoolean();
         var_2098 = param1.readInteger();
         var_1111 = param1.readInteger();
         var_2095 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_573.push(_loc4_);
            _loc3_++;
         }
         var_2097 = new RoomThumbnailData(param1);
         var_1808 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2096;
      }
      
      public function get roomName() : String
      {
         return var_654;
      }
      
      public function get userCount() : int
      {
         return var_1563;
      }
      
      public function get score() : int
      {
         return var_2098;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2095;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1728;
      }
      
      public function get tags() : Array
      {
         return var_573;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1808;
      }
      
      public function get event() : Boolean
      {
         return var_578;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1111;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2099;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2097;
      }
      
      public function get doorMode() : int
      {
         return var_1731;
      }
      
      public function get flatId() : int
      {
         return var_366;
      }
      
      public function get description() : String
      {
         return var_1110;
      }
   }
}
