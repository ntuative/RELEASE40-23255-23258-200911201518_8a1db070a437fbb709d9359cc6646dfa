package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1700:int;
      
      private var var_1698:int;
      
      private var var_975:String;
      
      private var var_1697:int;
      
      private var var_1699:String;
      
      private var var_1693:int;
      
      private var var_1696:int;
      
      private var _category:int;
      
      private var var_1694:int;
      
      private var var_1691:int;
      
      private var var_1692:int;
      
      private var var_1695:Boolean;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int)
      {
         super();
         var_1697 = param1;
         var_975 = param2;
         var_1698 = param3;
         var_1692 = param4;
         _category = param5;
         var_1699 = param6;
         var_1693 = param7;
         var_1700 = param8;
         var_1691 = param9;
         var_1696 = param10;
         var_1695 = param11;
         var_1694 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1692;
      }
      
      public function get groupable() : Boolean
      {
         return var_1695;
      }
      
      public function get creationMonth() : int
      {
         return var_1691;
      }
      
      public function get roomItemID() : int
      {
         return var_1698;
      }
      
      public function get itemType() : String
      {
         return var_975;
      }
      
      public function get itemID() : int
      {
         return var_1697;
      }
      
      public function get itemSpecificData() : String
      {
         return var_1699;
      }
      
      public function get songID() : int
      {
         return var_1694;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1693;
      }
      
      public function get creationYear() : int
      {
         return var_1696;
      }
      
      public function get creationDay() : int
      {
         return var_1700;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
