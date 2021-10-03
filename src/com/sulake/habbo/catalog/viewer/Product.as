package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.ProductTypeEnum;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import flash.display.BitmapData;
   
   public class Product extends ProductGridItem implements IProduct, IGetImageListener
   {
       
      
      private var var_1036:IProductData;
      
      private var var_1039:int;
      
      private var var_1038:String;
      
      private var var_1037:int;
      
      private var var_868:String;
      
      private var _furnitureData:IFurnitureData;
      
      private var var_867:int;
      
      public function Product(param1:CatalogPageMessageProductData, param2:IProductData, param3:IFurnitureData)
      {
         super();
         var_1038 = param1.productType;
         var_1037 = param1.furniClassId;
         var_868 = param1.extraParam;
         var_867 = param1.productCount;
         var_1039 = param1.expiration;
         var_1036 = param2;
         _furnitureData = param3;
      }
      
      public function get furnitureData() : IFurnitureData
      {
         return _furnitureData;
      }
      
      public function get productClassId() : int
      {
         return var_1037;
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         Logger.log("[Product] Bundle Icon Image Ready!" + param1);
         setIconImage(param2);
      }
      
      public function get productType() : String
      {
         return var_1038;
      }
      
      override public function set view(param1:IWindowContainer) : void
      {
         super.view = param1;
         if(var_867 > 1)
         {
            _view.findChildByName("multiContainer").visible = true;
            ITextWindow(_view.findChildByName("multiCounter")).text = "x" + productCount;
         }
      }
      
      public function get extraParam() : String
      {
         return var_868;
      }
      
      public function get productCount() : int
      {
         return var_867;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         var_1038 = "";
         var_1037 = 0;
         var_868 = "";
         var_867 = 0;
         var_1039 = 0;
         var_1036 = null;
      }
      
      public function initIcon(param1:IProductContainer, param2:IGetImageListener = null) : BitmapData
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         if(param2 == null)
         {
            param2 = {};
         }
         var _loc4_:IRoomEngine = (param1 as ProductContainer).offer.page.viewer.roomEngine;
         var _loc5_:IHabboCatalog = (param1 as ProductContainer).offer.page.viewer.catalog;
         switch(productType)
         {
            case ProductTypeEnum.const_154:
               _loc6_ = _loc4_.getFurnitureIcon(productClassId,param2);
               break;
            case ProductTypeEnum.const_139:
               _loc6_ = _loc4_.getWallItemIcon(productClassId,param2,var_868);
               break;
            case ProductTypeEnum.const_272:
               _loc3_ = _loc5_.getPixelEffectIcon(productClassId);
               break;
            case ProductTypeEnum.const_661:
               _loc3_ = _loc5_.getSubscriptionProductIcon(productClassId);
               break;
            default:
               Logger.log("[Product] Can not yet handle this type of product: " + productType);
         }
         if(_loc6_ != null)
         {
            _loc3_ = _loc6_.data;
            if(param2 == this)
            {
               this.setIconImage(_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function get expiration() : int
      {
         return var_1039;
      }
      
      public function get productData() : IProductData
      {
         return var_1036;
      }
   }
}
