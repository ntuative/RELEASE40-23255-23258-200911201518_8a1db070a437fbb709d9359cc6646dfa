package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1580:int;
      
      private var var_1786:int;
      
      private var var_1581:int;
      
      private var var_1587:int;
      
      private var _nutrition:int;
      
      private var var_1116:int;
      
      private var var_1586:int;
      
      private var var_1583:int;
      
      private var _energy:int;
      
      private var var_1585:int;
      
      private var var_1582:int;
      
      private var _ownerName:String;
      
      private var var_1589:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1580;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1786 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1580 = param1;
      }
      
      public function get petId() : int
      {
         return var_1116;
      }
      
      public function get experienceMax() : int
      {
         return var_1583;
      }
      
      public function get nutritionMax() : int
      {
         return var_1587;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1586 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1589;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1116 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1582;
      }
      
      public function get respect() : int
      {
         return var_1786;
      }
      
      public function get levelMax() : int
      {
         return var_1586;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1583 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1581 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1587 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1589 = param1;
      }
      
      public function get experience() : int
      {
         return var_1581;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1582 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1585 = param1;
      }
      
      public function get age() : int
      {
         return var_1585;
      }
   }
}
