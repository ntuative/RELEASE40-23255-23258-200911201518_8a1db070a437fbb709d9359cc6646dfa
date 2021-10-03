package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1641:int;
      
      private var var_2033:int = 0;
      
      private var var_2034:String;
      
      private var var_2035:int;
      
      private var var_2032:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1641 = param1;
         var_2035 = param2;
         var_2032 = param3;
         var_2034 = param4;
      }
      
      public function get length() : int
      {
         return var_2035;
      }
      
      public function get name() : String
      {
         return var_2032;
      }
      
      public function get creator() : String
      {
         return var_2034;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2033;
      }
      
      public function get id() : int
      {
         return var_1641;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2033 = param1;
      }
   }
}
