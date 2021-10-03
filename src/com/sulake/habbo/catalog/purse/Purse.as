package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1816:int = 0;
      
      private var var_1818:int = 0;
      
      private var var_1817:int = 0;
      
      private var var_1815:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1818;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1818 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1816 = param1;
      }
      
      public function get credits() : int
      {
         return var_1817;
      }
      
      public function get clubDays() : int
      {
         return var_1816;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1815 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1817 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1815;
      }
   }
}
