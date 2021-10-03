package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_1276:String;
      
      protected var var_2127:Boolean;
      
      protected var var_1700:int;
      
      protected var _type:int;
      
      protected var var_1696:int;
      
      protected var var_2124:Boolean;
      
      protected var var_1641:int;
      
      protected var var_2129:Boolean;
      
      protected var _id:int;
      
      protected var var_2128:int;
      
      protected var var_1642:String;
      
      protected var var_1695:Boolean;
      
      protected var _category:int;
      
      protected var var_1691:int;
      
      protected var var_2134:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:int, param11:int, param12:int, param13:String, param14:int)
      {
         super();
         _id = param1;
         _type = param2;
         var_2128 = param3;
         _category = param4;
         var_1695 = param5;
         var_2129 = param6;
         var_2127 = param7;
         var_1276 = param8;
         var_2134 = param9;
         var_1700 = param10;
         var_1691 = param11;
         var_1696 = param12;
         var_1642 = param13;
         var_1641 = param14;
      }
      
      public function get locked() : Boolean
      {
         return var_2124;
      }
      
      public function get songId() : int
      {
         return var_1641;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2124 = param1;
      }
      
      public function get ref() : int
      {
         return var_2128;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get slotId() : String
      {
         return var_1642;
      }
      
      public function get expires() : int
      {
         return var_2134;
      }
      
      public function get creationYear() : int
      {
         return var_1696;
      }
      
      public function get creationDay() : int
      {
         return var_1700;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2129;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get groupable() : Boolean
      {
         return var_1695;
      }
      
      public function get creationMonth() : int
      {
         return var_1691;
      }
      
      public function get extras() : String
      {
         return var_1276;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2127;
      }
   }
}
