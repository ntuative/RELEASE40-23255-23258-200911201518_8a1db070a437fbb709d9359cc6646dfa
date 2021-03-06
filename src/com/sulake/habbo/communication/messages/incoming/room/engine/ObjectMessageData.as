package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_981:int = 0;
      
      private var var_983:int = 0;
      
      private var _data:String = "";
      
      private var var_2222:int = 0;
      
      private var _state:int = 0;
      
      private var _type:int = 0;
      
      private var var_2221:String = "";
      
      private var _id:int = 0;
      
      private var var_204:Boolean = false;
      
      private var var_221:int = 0;
      
      private var var_1618:String = null;
      
      private var var_87:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_88:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_204)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_221;
      }
      
      public function get x() : Number
      {
         return var_87;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_221 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_204)
         {
            _state = param1;
         }
      }
      
      public function get staticClass() : String
      {
         return var_1618;
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_204)
         {
            var_1618 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_204)
         {
            _data = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_204)
         {
            var_981 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_204)
         {
            var_983 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_204)
         {
            var_88 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return var_983;
      }
      
      public function get sizeX() : int
      {
         return var_981;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_204)
         {
            var_87 = param1;
         }
      }
   }
}
