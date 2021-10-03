package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      private var var_221:int = 0;
      
      private var var_1568:int = 0;
      
      private var var_1837:Number = 0;
      
      private var var_1836:Number = 0;
      
      private var var_1835:Number = 0;
      
      private var var_1834:Number = 0;
      
      private var var_1833:Boolean = false;
      
      private var var_87:Number = 0;
      
      private var _id:int = 0;
      
      private var var_200:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_200 = [];
         super();
         _id = param1;
         var_87 = param2;
         _y = param3;
         var_88 = param4;
         var_1834 = param5;
         var_221 = param6;
         var_1568 = param7;
         var_1837 = param8;
         var_1836 = param9;
         var_1835 = param10;
         var_1833 = param11;
         var_200 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function get dir() : int
      {
         return var_221;
      }
      
      public function get localZ() : Number
      {
         return var_1834;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1833;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1568;
      }
      
      public function get targetX() : Number
      {
         return var_1837;
      }
      
      public function get targetY() : Number
      {
         return var_1836;
      }
      
      public function get targetZ() : Number
      {
         return var_1835;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get actions() : Array
      {
         return var_200.slice();
      }
   }
}
