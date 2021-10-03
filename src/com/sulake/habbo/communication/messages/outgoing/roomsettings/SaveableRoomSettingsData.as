package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_1807:Array;
      
      private var var_1808:Boolean;
      
      private var var_1110:String;
      
      private var var_1730:Boolean;
      
      private var var_1806:int;
      
      private var var_1731:int;
      
      private var var_1111:int;
      
      private var var_1729:Boolean;
      
      private var _roomId:int;
      
      private var var_1728:Boolean;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_573:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get maximumVisitors() : int
      {
         return var_1806;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1806 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get tags() : Array
      {
         return var_573;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1808;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1728;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1807 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         var_1728 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_573 = param1;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function get categoryId() : int
      {
         return var_1111;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1808 = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         var_1729 = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         var_1730 = param1;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1807;
      }
      
      public function get showOwnerName() : Boolean
      {
         return var_1729;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return var_1730;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1731 = param1;
      }
      
      public function get doorMode() : int
      {
         return var_1731;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1111 = param1;
      }
      
      public function set description(param1:String) : void
      {
         var_1110 = param1;
      }
      
      public function get description() : String
      {
         return var_1110;
      }
   }
}
