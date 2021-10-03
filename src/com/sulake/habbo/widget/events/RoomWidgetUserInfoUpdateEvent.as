package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_187:String = "RWUIUE_PEER";
      
      public static const const_201:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1289:String = "BOT";
      
      public static const const_838:int = 2;
      
      public static const const_1210:int = 0;
      
      public static const const_777:int = 3;
       
      
      private var var_1130:String = "";
      
      private var var_1717:Boolean = false;
      
      private var var_1591:int = 0;
      
      private var var_1711:int = 0;
      
      private var var_1709:Boolean = false;
      
      private var var_1131:String = "";
      
      private var var_1712:Boolean = false;
      
      private var _respectLeft:int = 0;
      
      private var var_1714:Boolean = true;
      
      private var var_1008:int = 0;
      
      private var var_1710:Boolean = false;
      
      private var var_1149:Boolean = false;
      
      private var var_1708:Boolean = false;
      
      private var var_1713:int = 0;
      
      private var var_1718:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_240:Array;
      
      private var var_1147:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1593:int = 0;
      
      private var var_1715:Boolean = false;
      
      private var var_1716:int = 0;
      
      private var var_1707:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_240 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1711;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1711 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1717;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1714;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1714 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1712 = param1;
      }
      
      public function get motto() : String
      {
         return var_1130;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1710 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1149;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1130 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1715;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1707;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1149 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1718;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1713 = param1;
      }
      
      public function get badges() : Array
      {
         return var_240;
      }
      
      public function get amIController() : Boolean
      {
         return var_1709;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1709 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1715 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1716 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1707 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1131 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1712;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1710;
      }
      
      public function get carryItem() : int
      {
         return var_1713;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1147;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1147 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         _respectLeft = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1716;
      }
      
      public function get realName() : String
      {
         return var_1131;
      }
      
      public function set webID(param1:int) : void
      {
         var_1593 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_240 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1708 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1718 = param1;
      }
      
      public function get respectLeft() : int
      {
         return _respectLeft;
      }
      
      public function get webID() : int
      {
         return var_1593;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1008 = param1;
      }
      
      public function get xp() : int
      {
         return var_1591;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1717 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1008;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1708;
      }
      
      public function set xp(param1:int) : void
      {
         var_1591 = param1;
      }
   }
}
