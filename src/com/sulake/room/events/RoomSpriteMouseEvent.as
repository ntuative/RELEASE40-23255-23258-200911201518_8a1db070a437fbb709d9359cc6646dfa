package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1812:Boolean = false;
      
      private var var_1814:Boolean = false;
      
      private var var_2091:String = "";
      
      private var _type:String = "";
      
      private var var_1811:Boolean = false;
      
      private var var_1621:Number = 0;
      
      private var var_2093:Number = 0;
      
      private var var_2094:Number = 0;
      
      private var var_2092:String = "";
      
      private var var_1623:Number = 0;
      
      private var var_1813:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2092 = param2;
         var_2091 = param3;
         var_2093 = param4;
         var_2094 = param5;
         var_1621 = param6;
         var_1623 = param7;
         var_1813 = param8;
         var_1814 = param9;
         var_1811 = param10;
         var_1812 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1813;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1812;
      }
      
      public function get localX() : Number
      {
         return var_1621;
      }
      
      public function get localY() : Number
      {
         return var_1623;
      }
      
      public function get canvasId() : String
      {
         return var_2092;
      }
      
      public function get altKey() : Boolean
      {
         return var_1814;
      }
      
      public function get spriteTag() : String
      {
         return var_2091;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2093;
      }
      
      public function get screenY() : Number
      {
         return var_2094;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1811;
      }
   }
}
