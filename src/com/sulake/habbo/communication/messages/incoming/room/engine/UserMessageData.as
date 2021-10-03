package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1106:String = "F";
      
      public static const const_942:String = "M";
       
      
      private var var_87:Number = 0;
      
      private var var_553:String = "";
      
      private var var_2110:int = 0;
      
      private var var_1592:String = "";
      
      private var var_1594:int = 0;
      
      private var var_1591:int = 0;
      
      private var var_1595:String = "";
      
      private var var_1052:String = "";
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_221:int = 0;
      
      private var var_2111:String = "";
      
      private var _name:String = "";
      
      private var var_1593:int = 0;
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_221;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_221 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_204)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_2110;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_204)
         {
            var_1594 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_2111;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_204)
         {
            var_1595 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_204)
         {
            var_2111 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_204)
         {
            var_1591 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_204)
         {
            var_553 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_204)
         {
            var_2110 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_204)
         {
            var_1052 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1594;
      }
      
      public function get groupID() : String
      {
         return var_1595;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_204)
         {
            var_1593 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_204)
         {
            var_1592 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function get sex() : String
      {
         return var_1052;
      }
      
      public function get figure() : String
      {
         return var_553;
      }
      
      public function get webID() : int
      {
         return var_1593;
      }
      
      public function get custom() : String
      {
         return var_1592;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_88 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_204)
         {
            var_87 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1591;
      }
   }
}
