package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_88:Number = 0;
      
      private var _data:String = "";
      
      private var var_2222:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1624:Boolean = false;
      
      private var var_2221:String = "";
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_221:String = "";
      
      private var var_1622:int = 0;
      
      private var var_1620:int = 0;
      
      private var var_1621:int = 0;
      
      private var var_1623:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1624 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1624;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_204)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_221;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_204)
         {
            var_1621 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_204)
         {
            var_1622 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_204)
         {
            var_1620 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_204)
         {
            var_221 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_204)
         {
            var_1623 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_204)
         {
            _state = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1621;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_204)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1622;
      }
      
      public function get wallY() : Number
      {
         return var_1620;
      }
      
      public function get localY() : Number
      {
         return var_1623;
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_88 = param1;
         }
      }
   }
}
