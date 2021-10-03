package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var var_1429:uint;
      
      private var var_967:uint;
      
      private var var_2103:int;
      
      private var var_1427:Number;
      
      private var _b:uint;
      
      private var var_1430:Number;
      
      private var var_1431:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_1428:Number;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         var_967 = parseInt(_loc2_,16);
         var_1429 = var_967 >> 16 & 255;
         var_1431 = var_967 >> 8 & 255;
         _b = var_967 >> 0 & 255;
         var_1428 = var_1429 / 255 * 1;
         var_1430 = var_1431 / 255 * 1;
         var_1427 = _b / 255 * 1;
         _colorTransform = new ColorTransform(var_1428,var_1430,var_1427);
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         var_2103 = param1;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return _colorTransform;
      }
      
      public function get rgb() : uint
      {
         return var_967;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return var_2103;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get g() : uint
      {
         return var_1431;
      }
      
      public function get b() : uint
      {
         return _b;
      }
      
      public function get r() : uint
      {
         return var_1429;
      }
   }
}
