package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_612:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1761:int;
      
      private var var_1762:int;
      
      private var var_1760:Boolean;
      
      private var var_921:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_612);
         var_1762 = param1;
         var_1761 = param2;
         _color = param3;
         var_921 = param4;
         var_1760 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1761;
      }
      
      public function get presetNumber() : int
      {
         return var_1762;
      }
      
      public function get brightness() : int
      {
         return var_921;
      }
      
      public function get apply() : Boolean
      {
         return var_1760;
      }
   }
}
