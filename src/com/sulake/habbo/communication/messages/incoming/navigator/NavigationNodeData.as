package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1190:int;
      
      private var var_1439:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1190 = param1;
         var_1439 = param2;
         Logger.log("READ NODE: " + var_1190 + ", " + var_1439);
      }
      
      public function get nodeName() : String
      {
         return var_1439;
      }
      
      public function get nodeId() : int
      {
         return var_1190;
      }
   }
}
