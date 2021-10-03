package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1786:int;
      
      private var var_1138:PetData;
      
      private var var_1853:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1786;
      }
      
      public function get petData() : PetData
      {
         return var_1138;
      }
      
      public function flush() : Boolean
      {
         var_1138 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_1853;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1786 = param1.readInteger();
         var_1853 = param1.readInteger();
         var_1138 = new PetData(param1);
         return true;
      }
   }
}
