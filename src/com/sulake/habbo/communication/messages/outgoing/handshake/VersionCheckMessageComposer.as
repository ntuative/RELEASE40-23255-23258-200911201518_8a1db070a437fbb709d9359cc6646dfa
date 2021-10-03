package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1934:String;
      
      private var var_1249:String;
      
      private var var_1933:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1933 = param1;
         var_1249 = param2;
         var_1934 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1933,var_1249,var_1934];
      }
      
      public function dispose() : void
      {
      }
   }
}
