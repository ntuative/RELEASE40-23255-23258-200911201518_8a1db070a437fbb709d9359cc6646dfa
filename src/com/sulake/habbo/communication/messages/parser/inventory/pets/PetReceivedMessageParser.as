package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_937:PetData;
      
      private var var_1372:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1372 = param1.readBoolean();
         var_937 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1372 + ", " + var_937.id + ", " + var_937.name + ", " + pet.figure + ", " + var_937.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1372;
      }
      
      public function get pet() : PetData
      {
         return var_937;
      }
   }
}
