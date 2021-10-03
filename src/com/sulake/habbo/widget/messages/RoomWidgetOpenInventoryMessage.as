package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_783:String = "inventory_badges";
      
      public static const const_1312:String = "inventory_clothes";
      
      public static const const_1155:String = "inventory_furniture";
      
      public static const const_701:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_977:String = "inventory_effects";
       
      
      private var var_1737:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_701);
         var_1737 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1737;
      }
   }
}
