package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionErrorMessageEvent extends RoomSessionEvent
   {
      
      public static const const_160:String = "RSEME_MAX_PETS";
      
      public static const const_648:String = "RSEME_PETS_FORBIDDEN_IN_FLAT";
      
      public static const const_196:String = "RSEME_KICKED";
      
      public static const const_636:String = "RSEME_PETS_FORBIDDEN_IN_HOTEL";
      
      public static const const_202:String = "RSEME_MAX_STICKIES";
      
      public static const const_867:String = "RSEME_DOOR_OTHER_DELETED";
      
      public static const const_668:String = "RSEME_NO_FREE_TILES_FOR_PET";
      
      public static const const_212:String = "RSEME_GUIDE_EXISTS";
      
      public static const const_192:String = "RSEME_MAX_SOUND";
      
      public static const const_216:String = "RSEME_MAX_FURNITURE";
      
      public static const const_189:String = "RSEME_GUIDE_BUSY";
      
      public static const const_204:String = "RSEME_INVALID_ITEM_LOC";
      
      public static const const_205:String = "RSEME_MAX_QUEUE";
      
      public static const const_672:String = "RSEME_CANT_SET_NOT_OWNER";
      
      public static const const_607:String = "RSEME_SELECTED_TILE_NOT_FREE_FOR_PET";
      
      public static const const_902:String = "RSEME_DOOR_NOT_INSTALLED";
      
      public static const const_180:String = "RSEME_CANT_TRADE_STUFF";
       
      
      private var _message:String;
      
      public function RoomSessionErrorMessageEvent(param1:String, param2:IRoomSession, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param4,param5);
         _message = param3;
      }
      
      public function get message() : String
      {
         return _message;
      }
   }
}
