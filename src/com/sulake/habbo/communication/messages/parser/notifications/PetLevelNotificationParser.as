package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_553:String;
      
      private var var_1580:int;
      
      private var var_2104:String;
      
      private var var_980:int;
      
      private var var_1116:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1116;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1116 = param1.readInteger();
         var_2104 = param1.readString();
         var_1580 = param1.readInteger();
         var_553 = param1.readString();
         var_980 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2104;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_553;
      }
      
      public function get petType() : int
      {
         return var_980;
      }
      
      public function get level() : int
      {
         return var_1580;
      }
   }
}
