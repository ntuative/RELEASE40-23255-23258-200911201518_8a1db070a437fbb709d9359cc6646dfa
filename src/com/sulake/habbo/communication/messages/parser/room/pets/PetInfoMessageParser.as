package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1585:int;
      
      private var var_553:String;
      
      private var var_1580:int;
      
      private var var_1786:int;
      
      private var var_1581:int;
      
      private var var_1877:int;
      
      private var _nutrition:int;
      
      private var var_1116:int;
      
      private var var_1876:int;
      
      private var var_1874:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1589:int;
      
      private var var_1875:int;
      
      public function PetInfoMessageParser()
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
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1877;
      }
      
      public function flush() : Boolean
      {
         var_1116 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1876;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1874;
      }
      
      public function get maxNutrition() : int
      {
         return var_1875;
      }
      
      public function get figure() : String
      {
         return var_553;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1786;
      }
      
      public function get petId() : int
      {
         return var_1116;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1116 = param1.readInteger();
         _name = param1.readString();
         var_1580 = param1.readInteger();
         var_1876 = param1.readInteger();
         var_1581 = param1.readInteger();
         var_1874 = param1.readInteger();
         _energy = param1.readInteger();
         var_1877 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1875 = param1.readInteger();
         var_553 = param1.readString();
         var_1786 = param1.readInteger();
         var_1589 = param1.readInteger();
         _ownerName = param1.readString();
         var_1585 = param1.readInteger();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1581;
      }
      
      public function get ownerId() : int
      {
         return var_1589;
      }
      
      public function get age() : int
      {
         return var_1585;
      }
   }
}
