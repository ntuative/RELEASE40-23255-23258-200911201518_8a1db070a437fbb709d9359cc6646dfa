package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class FlatCategory
   {
       
      
      private var var_1190:int;
      
      private var var_1439:String;
      
      public function FlatCategory()
      {
         super();
      }
      
      public function set nodeName(param1:String) : void
      {
         var_1439 = param1;
      }
      
      public function get nodeName() : String
      {
         return var_1439;
      }
      
      public function set nodeId(param1:int) : void
      {
         var_1190 = param1;
      }
      
      public function get nodeId() : int
      {
         return var_1190;
      }
   }
}
