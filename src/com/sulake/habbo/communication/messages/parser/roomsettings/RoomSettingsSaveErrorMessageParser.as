package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1372:int = 9;
      
      public static const const_1441:int = 4;
      
      public static const const_1416:int = 1;
      
      public static const const_1136:int = 10;
      
      public static const const_1472:int = 2;
      
      public static const const_1248:int = 7;
      
      public static const const_1252:int = 11;
      
      public static const const_1467:int = 3;
      
      public static const const_1168:int = 8;
      
      public static const const_1109:int = 5;
      
      public static const const_1455:int = 6;
      
      public static const const_1145:int = 12;
       
      
      private var var_2000:String;
      
      private var _roomId:int;
      
      private var var_1060:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2000;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1060 = param1.readInteger();
         var_2000 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1060;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
