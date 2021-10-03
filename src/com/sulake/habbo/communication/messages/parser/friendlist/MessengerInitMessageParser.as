package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2163:int;
      
      private var var_2165:int;
      
      private var var_2161:int;
      
      private var var_212:Array;
      
      private var var_2164:int;
      
      private var var_2162:int;
      
      private var var_308:Array;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_308 = new Array();
         this.var_212 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2163;
      }
      
      public function get friends() : Array
      {
         return this.var_212;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2161;
      }
      
      public function get categories() : Array
      {
         return this.var_308;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2165;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2162;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2162 = param1.readInteger();
         this.var_2161 = param1.readInteger();
         this.var_2163 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_308.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_212.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2165 = param1.readInteger();
         this.var_2164 = param1.readInteger();
         return true;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2164;
      }
   }
}
