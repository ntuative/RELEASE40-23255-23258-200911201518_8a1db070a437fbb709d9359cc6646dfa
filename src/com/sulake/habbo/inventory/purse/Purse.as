package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2029:Boolean = false;
      
      private var var_2027:int = 0;
      
      private var var_1816:int = 0;
      
      private var var_2028:int = 0;
      
      private var var_2030:int = 0;
      
      private var var_1815:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_2030 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2027;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2029;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2029 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2027 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1816 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_2030;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2028 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1816;
      }
      
      public function get pixelBalance() : int
      {
         return var_2028;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1815 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1815;
      }
   }
}
