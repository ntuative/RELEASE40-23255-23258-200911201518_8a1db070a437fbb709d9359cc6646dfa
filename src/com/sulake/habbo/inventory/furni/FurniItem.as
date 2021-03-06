package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1646:int;
      
      private var var_1645:Boolean;
      
      private var var_1641:int;
      
      private var var_1647:String;
      
      private var var_1648:Boolean = false;
      
      private var var_1644:int;
      
      private var var_410:int;
      
      private var var_975:String;
      
      private var var_1642:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1145:int;
      
      private var var_1640:Boolean;
      
      private var var_1643:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1646 = param1;
         var_975 = param2;
         _objId = param3;
         var_1145 = param4;
         var_1647 = param5;
         var_1645 = param6;
         var_1640 = param7;
         var_1644 = param8;
         var_1642 = param9;
         var_1641 = param10;
         var_410 = -1;
      }
      
      public function get songId() : int
      {
         return var_1641;
      }
      
      public function get iconCallbackId() : int
      {
         return var_410;
      }
      
      public function get expiryTime() : int
      {
         return var_1644;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_1643 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_1648 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_410 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1640;
      }
      
      public function get slotId() : String
      {
         return var_1642;
      }
      
      public function get classId() : int
      {
         return var_1145;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1645;
      }
      
      public function get stuffData() : String
      {
         return var_1647;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1646;
      }
      
      public function get isLocked() : Boolean
      {
         return var_1648;
      }
      
      public function get prevCallbackId() : int
      {
         return var_1643;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_975;
      }
   }
}
