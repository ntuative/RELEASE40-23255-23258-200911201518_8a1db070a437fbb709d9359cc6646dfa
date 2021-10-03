package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_553:String;
      
      private var var_2181:String;
      
      private var var_2180:int;
      
      private var var_2178:int;
      
      private var var_1052:String;
      
      private var var_1131:String;
      
      private var _name:String;
      
      private var var_799:int;
      
      private var _respectLeft:int;
      
      private var var_2179:int;
      
      private var var_1749:int;
      
      private var var_2177:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2178;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1131;
      }
      
      public function get customData() : String
      {
         return this.var_2181;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_799;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2180;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2177;
      }
      
      public function get figure() : String
      {
         return this.var_553;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1749;
      }
      
      public function get sex() : String
      {
         return this.var_1052;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_553 = param1.readString();
         this.var_1052 = param1.readString();
         this.var_2181 = param1.readString();
         this.var_1131 = param1.readString();
         this.var_2179 = param1.readInteger();
         this.var_2177 = param1.readString();
         this.var_2180 = param1.readInteger();
         this.var_2178 = param1.readInteger();
         this.var_1749 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_799 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2179;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
   }
}
