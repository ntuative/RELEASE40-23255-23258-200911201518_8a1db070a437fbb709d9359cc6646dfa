package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1878:Number;
      
      private var var_539:Number = 0;
      
      private var var_1879:Number;
      
      private var var_538:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1878 = param1;
         var_1879 = param2;
      }
      
      public function update() : void
      {
         var_538 += var_1879;
         var_539 += var_538;
         if(var_539 > 0)
         {
            var_539 = 0;
            var_538 = var_1878 * -1 * var_538;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_538 = param1;
         var_539 = 0;
      }
      
      public function get location() : Number
      {
         return var_539;
      }
   }
}
