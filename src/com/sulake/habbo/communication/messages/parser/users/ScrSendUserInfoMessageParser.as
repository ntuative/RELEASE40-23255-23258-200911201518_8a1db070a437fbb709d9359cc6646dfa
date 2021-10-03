package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1523:int;
      
      private var var_1200:String;
      
      private var var_1522:int;
      
      private var var_1525:int;
      
      private var var_1524:int;
      
      private var var_1521:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1200;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1521;
      }
      
      public function get responseType() : int
      {
         return var_1525;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1522;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1200 = param1.readString();
         var_1522 = param1.readInteger();
         var_1523 = param1.readInteger();
         var_1524 = param1.readInteger();
         var_1525 = param1.readInteger();
         var_1521 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_1523;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1524;
      }
   }
}
