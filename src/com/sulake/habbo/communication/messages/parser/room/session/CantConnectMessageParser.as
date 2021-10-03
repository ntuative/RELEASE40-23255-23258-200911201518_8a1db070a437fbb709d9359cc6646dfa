package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1529:int = 2;
      
      public static const const_315:int = 4;
      
      public static const const_1123:int = 1;
      
      public static const const_1157:int = 3;
       
      
      private var var_947:int = 0;
      
      private var var_771:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_947;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_947 = param1.readInteger();
         if(var_947 == 3)
         {
            var_771 = param1.readString();
         }
         else
         {
            var_771 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_947 = 0;
         var_771 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_771;
      }
   }
}
