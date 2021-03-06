package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_983:int = 0;
      
      private var var_88:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_204:Boolean = false;
      
      private var var_221:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var var_87:Number = 0;
      
      private var var_981:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
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
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get dir() : int
      {
         return var_221;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         if(!var_204)
         {
            _name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_204)
         {
            var_221 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_204)
         {
            _y = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_204 = true;
      }
      
      public function get z() : Number
      {
         return var_88;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_204)
         {
            var_983 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_204)
         {
            var_981 = param1;
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
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set type(param1:String) : void
      {
         if(!var_204)
         {
            _type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_981;
      }
   }
}
