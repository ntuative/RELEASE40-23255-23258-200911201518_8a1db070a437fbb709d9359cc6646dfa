package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_137:int = 1;
      
      public static const const_1243:int = 3;
      
      public static const const_444:int = 2;
       
      
      private var var_1659:int;
      
      private var var_1660:int;
      
      private var var_1663:int;
      
      private var var_1666:int;
      
      private var _state:int;
      
      private var var_366:int;
      
      private var var_1086:int;
      
      private var var_1661:int;
      
      private var var_974:int;
      
      private var _roomResources:String;
      
      private var var_1658:int;
      
      private var var_1656:int;
      
      private var var_1664:String;
      
      private var var_1667:String;
      
      private var var_1665:int = 0;
      
      private var var_1203:String;
      
      private var _message:String;
      
      private var var_1668:int;
      
      private var var_1662:String;
      
      private var var_1111:int;
      
      private var var_654:String;
      
      private var var_1657:String;
      
      private var var_1307:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_974 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1665 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1656;
      }
      
      public function set roomName(param1:String) : void
      {
         var_654 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1658 = param1;
      }
      
      public function get state() : int
      {
         return _state;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_654;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1666 = param1;
      }
      
      public function set state(param1:int) : void
      {
         _state = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1660;
      }
      
      public function get priority() : int
      {
         return var_1659 + var_1665;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1661 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1667;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1307) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1111;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1656 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1086;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1664 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1658;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1666;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1657 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1203 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1661;
      }
      
      public function set priority(param1:int) : void
      {
         var_1659 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1660 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1664;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1663 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1667 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1668 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1203;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1086 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1663;
      }
      
      public function set flatId(param1:int) : void
      {
         var_366 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1111 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1307 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1668;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1662 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1307;
      }
      
      public function get reportedUserId() : int
      {
         return var_974;
      }
      
      public function get flatId() : int
      {
         return var_366;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1657;
      }
      
      public function get reporterUserName() : String
      {
         return var_1662;
      }
   }
}
