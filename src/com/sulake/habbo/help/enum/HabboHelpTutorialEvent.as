package com.sulake.habbo.help.enum
{
   import flash.events.Event;
   
   public class HabboHelpTutorialEvent extends Event
   {
      
      public static const const_526:String = "HHTPNUFWE_DONE_GUIDEBOT";
      
      public static const const_98:String = "HHTPNUFWE_AVATAR_TUTORIAL_START";
      
      public static const const_399:String = "HHTPNUFWE_LIGHT_CLOTHES_ICON";
       
      
      public function HabboHelpTutorialEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
