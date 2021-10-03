package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRedeemClubPromoMessage extends RoomWidgetMessage
   {
      
      public static const const_552:String = "rwrcp_redeem_club_promo";
       
      
      private var var_1918:String;
      
      private var var_1917:Boolean;
      
      public function RoomWidgetRedeemClubPromoMessage(param1:String, param2:String, param3:Boolean)
      {
         super(param1);
         var_1918 = param2;
         var_1917 = param3;
      }
      
      public function get code() : String
      {
         return var_1918;
      }
      
      public function get isTrial() : Boolean
      {
         return var_1917;
      }
   }
}
