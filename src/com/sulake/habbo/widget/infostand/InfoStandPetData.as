package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1580:int;
      
      private var var_1581:int;
      
      private var var_1587:int;
      
      private var _type:int;
      
      private var var_1116:int = -1;
      
      private var var_1586:int;
      
      private var _nutrition:int;
      
      private var var_1583:int;
      
      private var _energy:int;
      
      private var var_1722:int;
      
      private var var_1582:int;
      
      private var var_1584:int;
      
      private var var_1585:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_1590:Boolean;
      
      private var _name:String = "";
      
      private var var_1589:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_1590;
      }
      
      public function get level() : int
      {
         return var_1580;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get experienceMax() : int
      {
         return var_1583;
      }
      
      public function get id() : int
      {
         return var_1116;
      }
      
      public function get nutritionMax() : int
      {
         return var_1587;
      }
      
      public function get ownerId() : int
      {
         return var_1589;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         _name = param1.name;
         var_1116 = param1.id;
         _type = param1.petType;
         var_1722 = param1.petRace;
         _image = param1.image;
         var_1590 = param1.isOwnPet;
         var_1589 = param1.ownerId;
         _ownerName = param1.ownerName;
         _canOwnerBeKicked = param1.canOwnerBeKicked;
         var_1580 = param1.level;
         var_1586 = param1.levelMax;
         var_1581 = param1.experience;
         var_1583 = param1.experienceMax;
         _energy = param1.energy;
         var_1582 = param1.energyMax;
         _nutrition = param1.nutrition;
         var_1587 = param1.nutritionMax;
         _petRespect = param1.petRespect;
         var_1584 = param1.roomIndex;
         var_1585 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return var_1584;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get energyMax() : int
      {
         return var_1582;
      }
      
      public function get levelMax() : int
      {
         return var_1586;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get race() : int
      {
         return var_1722;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1581;
      }
      
      public function get age() : int
      {
         return var_1585;
      }
   }
}
