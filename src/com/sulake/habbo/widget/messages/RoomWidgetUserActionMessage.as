package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_683:String = "RWUAM_RESPECT_USER";
      
      public static const const_555:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_575:String = "RWUAM_START_TRADING";
      
      public static const const_624:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_694:String = "RWUAM_WHISPER_USER";
      
      public static const const_676:String = "RWUAM_IGNORE_USER";
      
      public static const const_705:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_642:String = "RWUAM_BAN_USER";
      
      public static const const_588:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_446:String = "RWUAM_KICK_USER";
      
      public static const const_559:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_585:String = " RWUAM_RESPECT_PET";
      
      public static const const_372:String = "RWUAM_KICK_BOT";
      
      public static const const_1112:String = "RWUAM_TRAIN_PET";
      
      public static const const_685:String = "RWUAM_PICKUP_PET";
      
      public static const const_508:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_633:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
