package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_114:int = 1;
      
      public static const const_252:int = 4;
      
      public static const const_248:int = 3;
      
      public static const const_102:int = 0;
      
      public static const const_586:String = "RWCUE_EVENT_CHAT";
      
      public static const const_95:int = 2;
       
      
      private var var_1963:int;
      
      private var var_192:String = "";
      
      private var var_1964:BitmapData;
      
      private var _userName:String;
      
      private var var_1057:int = 0;
      
      private var var_1962:uint;
      
      private var _userId:int = 0;
      
      private var _roomCategory:int;
      
      private var var_1960:Number;
      
      private var var_1961:Number;
      
      private var _roomId:int;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Boolean = false, param14:Boolean = false)
      {
         super(param1,param13,param14);
         _userId = param2;
         var_192 = param3;
         var_1057 = param12;
         _userName = param4;
         var_1963 = param5;
         var_1960 = param6;
         var_1961 = param7;
         var_1964 = param8;
         var_1962 = param9;
         _roomId = param10;
         _roomCategory = param11;
      }
      
      public function get roomCategory() : int
      {
         return _roomCategory;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get userImage() : BitmapData
      {
         return var_1964;
      }
      
      public function get text() : String
      {
         return var_192;
      }
      
      public function get userX() : Number
      {
         return var_1960;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
      
      public function get userCategory() : int
      {
         return var_1963;
      }
      
      public function get chatType() : int
      {
         return var_1057;
      }
      
      public function get userColor() : uint
      {
         return var_1962;
      }
      
      public function get userY() : Number
      {
         return var_1961;
      }
   }
}
