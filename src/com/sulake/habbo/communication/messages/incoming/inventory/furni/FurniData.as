package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1647:String;
      
      private var var_975:String;
      
      private var var_2120:Boolean;
      
      private var var_1646:int;
      
      private var var_1645:Boolean;
      
      private var var_1642:String = "";
      
      private var _category:int;
      
      private var var_1145:int;
      
      private var var_1640:Boolean;
      
      private var var_1641:int = -1;
      
      private var _objId:int;
      
      private var var_1644:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:int)
      {
         super();
         var_1646 = param1;
         var_975 = param2;
         _objId = param3;
         var_1145 = param4;
         _category = param5;
         var_1647 = param6;
         var_2120 = param7;
         var_1645 = param8;
         var_1640 = param9;
         var_1644 = param10;
      }
      
      public function get classId() : int
      {
         return var_1145;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2120;
      }
      
      public function get stripId() : int
      {
         return var_1646;
      }
      
      public function get stuffData() : String
      {
         return var_1647;
      }
      
      public function get songId() : int
      {
         return var_1641;
      }
      
      public function setSongData(param1:String, param2:int) : void
      {
         var_1642 = param1;
         var_1641 = param2;
      }
      
      public function get expiryTime() : int
      {
         return var_1644;
      }
      
      public function get itemType() : String
      {
         return var_975;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get slotId() : String
      {
         return var_1642;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1640;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1645;
      }
   }
}
