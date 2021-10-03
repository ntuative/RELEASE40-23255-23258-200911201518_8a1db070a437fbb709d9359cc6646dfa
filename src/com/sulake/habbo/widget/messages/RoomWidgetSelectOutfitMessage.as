package com.sulake.habbo.widget.messages
{
   public class RoomWidgetSelectOutfitMessage extends RoomWidgetMessage
   {
      
      public static const const_895:String = "select_outfit";
       
      
      private var var_1883:int;
      
      public function RoomWidgetSelectOutfitMessage(param1:int)
      {
         super(const_895);
         var_1883 = param1;
      }
      
      public function get outfitId() : int
      {
         return var_1883;
      }
   }
}
