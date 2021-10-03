package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1761:int;
      
      private var var_1762:int;
      
      private var var_2046:Boolean;
      
      private var var_2047:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2045:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1762 = param1;
         var_1761 = param2;
         var_2047 = param3;
         var_2045 = param4;
         var_2046 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1762,var_1761,var_2047,var_2045,int(var_2046)];
      }
      
      public function dispose() : void
      {
      }
   }
}
