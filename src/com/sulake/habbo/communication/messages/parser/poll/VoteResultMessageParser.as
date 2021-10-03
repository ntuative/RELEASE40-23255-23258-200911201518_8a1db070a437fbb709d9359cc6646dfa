package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1152:int;
      
      private var var_873:String;
      
      private var var_602:Array;
      
      private var var_950:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_602.slice();
      }
      
      public function flush() : Boolean
      {
         var_873 = "";
         var_950 = [];
         var_602 = [];
         var_1152 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1152;
      }
      
      public function get question() : String
      {
         return var_873;
      }
      
      public function get choices() : Array
      {
         return var_950.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_873 = param1.readString();
         var_950 = [];
         var_602 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_950.push(param1.readString());
            var_602.push(param1.readInteger());
            _loc3_++;
         }
         var_1152 = param1.readInteger();
         return true;
      }
   }
}
