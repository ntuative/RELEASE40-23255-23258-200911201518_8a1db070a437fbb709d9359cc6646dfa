package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToWidth implements BinarySearchTest
   {
       
      
      private var var_387:int;
      
      private var var_172:String;
      
      private var var_192:ITextWindow;
      
      public function CutToWidth()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_172 = param1;
         var_192 = param2;
         var_387 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_192.text = var_172.substring(0,param1) + "...";
         return var_192.textWidth > var_387;
      }
   }
}
