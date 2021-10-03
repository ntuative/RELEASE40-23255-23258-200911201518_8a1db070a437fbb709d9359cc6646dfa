package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1354:int = 10;
       
      
      private var var_1368:NavigatorSettingsMessageParser;
      
      private var var_1123:int;
      
      private var var_1825:Boolean;
      
      private var var_1824:int;
      
      private var var_757:Dictionary;
      
      private var var_2168:int;
      
      private var var_1826:int;
      
      private var var_1758:int;
      
      private var var_308:Array;
      
      private var var_1823:int;
      
      private var var_1079:Array;
      
      private var var_525:PublicRoomShortData;
      
      private var var_372:RoomEventData;
      
      private var var_129:MsgWithRequestId;
      
      private var var_1510:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1827:Boolean;
      
      private var var_191:GuestRoomData;
      
      private var var_619:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_308 = new Array();
         var_757 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1824;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1827;
      }
      
      public function startLoading() : void
      {
         this.var_619 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1827 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_372 != null)
         {
            var_372.dispose();
         }
         var_372 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_129 != null && var_129 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_129 != null && var_129 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_129 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_191;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_525 = null;
         var_191 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_525 = param1.publicSpace;
            var_372 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(var_372 != null)
         {
            var_372.dispose();
            var_372 = null;
         }
         if(var_525 != null)
         {
            var_525.dispose();
            var_525 = null;
         }
         if(var_191 != null)
         {
            var_191.dispose();
            var_191 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_129 = param1;
         var_619 = false;
         if(var_1079 == null)
         {
            var_1079 = param1.topLevelNodes;
         }
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1368;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_129 = param1;
         var_619 = false;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function getCategoryByIndex(param1:int) : FlatCategory
      {
         if(var_308.length > param1)
         {
            return var_308[param1] as FlatCategory;
         }
         return null;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2168 = param1.limit;
         this.var_1123 = param1.favouriteRoomIds.length;
         this.var_757 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_757[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_129 as PopularRoomTagsData;
      }
      
      public function get categories() : Array
      {
         return var_308;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_525;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1758 = param1;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1825;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_129 = param1;
         var_619 = false;
      }
      
      public function getCategoryIndexById(param1:int) : int
      {
         var _loc2_:int = 0;
         while(_loc2_ < var_308.length)
         {
            if((var_308[_loc2_] as FlatCategory).nodeId == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_191 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_619;
      }
      
      public function set categories(param1:Array) : void
      {
         var_308 = param1;
      }
      
      public function get currentRoomRating() : int
      {
         return var_1826;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1823;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1368 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_129 == null)
         {
            return;
         }
         var_129.dispose();
         var_129 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_372;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_757[param1] = !!param2 ? "yes" : null;
         var_1123 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_129 as OfficialRoomsData;
      }
      
      public function get topLevelNodes() : Array
      {
         return var_1079;
      }
      
      public function get avatarId() : int
      {
         return var_1758;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_129 != null && var_129 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1825 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1826 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1510 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_191 != null)
         {
            var_191.dispose();
         }
         var_191 = param1;
      }
      
      public function getCategoryById(param1:int) : FlatCategory
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_308)
         {
            if(_loc2_.nodeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_191 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1368.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1123 >= var_2168;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1823 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1510;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_191 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1824 = param1;
      }
   }
}
