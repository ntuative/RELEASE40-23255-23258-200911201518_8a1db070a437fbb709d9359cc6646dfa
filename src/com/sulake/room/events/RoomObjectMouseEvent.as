package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1485:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1393:String = "ROE_MOUSE_ENTER";
      
      public static const const_354:String = "ROE_MOUSE_MOVE";
      
      public static const const_1374:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_209:String = "ROE_MOUSE_CLICK";
      
      public static const const_453:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1811:Boolean;
      
      private var var_1812:Boolean;
      
      private var var_1814:Boolean;
      
      private var var_1813:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1814 = param4;
         var_1813 = param5;
         var_1811 = param6;
         var_1812 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1812;
      }
      
      public function get altKey() : Boolean
      {
         return var_1814;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1813;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1811;
      }
   }
}
