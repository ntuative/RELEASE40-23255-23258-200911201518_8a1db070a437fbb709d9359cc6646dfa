package com.sulake.core.window.graphics
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.renderer.BitmapDataRenderer;
   import com.sulake.core.window.graphics.renderer.BitmapSkinRenderer;
   import com.sulake.core.window.graphics.renderer.FillSkinRenderer;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import com.sulake.core.window.graphics.renderer.NullSkinRenderer;
   import com.sulake.core.window.graphics.renderer.ShapeSkinRenderer;
   import com.sulake.core.window.graphics.renderer.SkinRenderer;
   import com.sulake.core.window.graphics.renderer.TextSkinRenderer;
   import com.sulake.core.window.utils.StateCodeTable;
   import com.sulake.core.window.utils.TypeCodeTable;
   import flash.utils.Dictionary;
   
   public class SkinContainer implements ISkinContainer
   {
      
      protected static var var_353:Array;
      
      private static const const_1005:uint = 8;
       
      
      private var var_439:Dictionary;
      
      private var var_1720:Dictionary;
      
      private var var_1719:Dictionary;
      
      private var var_518:Dictionary;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1093:Dictionary;
      
      private var var_1345:Dictionary;
      
      public function SkinContainer(param1:XML, param2:IAssetLibrary)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         super();
         _assetLibrary = param2;
         var_518 = new Dictionary();
         var_1345 = new Dictionary();
         var_1719 = new Dictionary();
         TypeCodeTable.fillTables(var_1345,var_1719);
         var_1093 = new Dictionary();
         var_1720 = new Dictionary();
         StateCodeTable.fillTables(var_1093,var_1720);
         var_439 = new Dictionary();
         var_439["skin"] = BitmapSkinRenderer;
         var_439["bitmap"] = BitmapDataRenderer;
         var_439["fill"] = FillSkinRenderer;
         var_439["text"] = TextSkinRenderer;
         var_439["shape"] = ShapeSkinRenderer;
         var_439["unknown"] = SkinRenderer;
         var_439["HabboRoomWidgetLib_trophy_bg_silver"] = NullSkinRenderer;
         if(var_353 == null)
         {
            var_353 = new Array();
            var_353.push(WindowState.const_60);
            var_353.push(WindowState.const_66);
            var_353.push(WindowState.const_86);
            var_353.push(WindowState.const_48);
            var_353.push(WindowState.const_73);
            var_353.push(WindowState.const_71);
            var_353.push(WindowState.const_81);
            var_353.push(WindowState.const_77);
         }
         var _loc3_:Array = new Array();
         for(_loc4_ in var_1093)
         {
            _loc3_.push(var_1093[_loc4_]);
         }
         if(param1 != null)
         {
            _loc5_ = param1.child("component");
            _loc6_ = uint(_loc5_.length());
            if(_loc6_ > 0)
            {
               _loc18_ = 0;
               while(_loc18_ < _loc6_)
               {
                  _loc7_ = _loc5_[_loc18_];
                  _loc9_ = _loc7_.attribute("type");
                  _loc11_ = _loc7_.attribute("skin");
                  _loc10_ = _loc7_.attribute("style");
                  _loc14_ = _loc7_.attribute("layout");
                  _loc16_ = _loc7_.attribute("renderer");
                  _loc8_ = _loc7_.child("states");
                  _loc17_ = var_439[_loc16_];
                  _loc15_ = new _loc17_(_loc3_);
                  _loc12_ = _assetLibrary.getAssetByName(_loc11_);
                  _loc13_ = _loc12_ != null ? _loc12_.content as XML : null;
                  if(_loc13_ != null)
                  {
                     BitmapSkinParser.parseSkinDescription(_loc13_,_loc8_,_loc15_,_loc14_,_assetLibrary);
                  }
                  addSkinRenderer(var_1345[_loc9_],uint(_loc10_),_loc15_);
                  _loc18_++;
               }
            }
         }
      }
      
      public function get assets() : IAssetLibrary
      {
         return _assetLibrary;
      }
      
      public function method_10(param1:uint, param2:uint) : ISkinRenderer
      {
         var _loc3_:Array = var_518[param1];
         return _loc3_ != null ? _loc3_[param2] : null;
      }
      
      public function addSkinRenderer(param1:uint, param2:uint, param3:ISkinRenderer) : void
      {
         if(true)
         {
            var_518[param1] = new Array(SkinContainer.const_1005);
         }
         var_518[param1][param2] = param3;
      }
      
      public function getTheActualState(param1:uint, param2:uint, param3:uint) : uint
      {
         var _loc5_:int = 0;
         var _loc4_:ISkinRenderer = method_10(param1,param2);
         if(_loc4_ != null)
         {
            for each(_loc5_ in var_353)
            {
               if((param3 & _loc5_) == _loc5_)
               {
                  if(_loc4_.isStateDrawable(_loc5_))
                  {
                     return _loc5_;
                  }
               }
            }
         }
         return 0;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         for(_loc1_ in var_518)
         {
            ISkinRenderer(var_518[_loc1_]).dispose();
            delete var_518[_loc1_];
         }
         _assetLibrary.dispose();
         _assetLibrary = null;
      }
   }
}
