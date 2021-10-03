package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer
   {
      
      public static const const_967:String = "price_type_none";
      
      public static const const_349:String = "pricing_model_multi";
      
      public static const const_309:String = "price_type_credits";
      
      public static const const_355:String = "price_type_credits_and_pixels";
      
      public static const const_472:String = "pricing_model_bundle";
      
      public static const const_441:String = "pricing_model_single";
      
      public static const const_599:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1102:String = "pricing_model_unknown";
      
      public static const const_364:String = "price_type_pixels";
       
      
      private var var_717:int;
      
      private var var_1065:int;
      
      private var var_716:int;
      
      private var var_362:String;
      
      private var var_507:String;
      
      private var var_1604:int;
      
      private var var_601:ICatalogPage;
      
      private var var_1064:String;
      
      private var var_363:IProductContainer;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         var_1065 = param1.offerId;
         var_1064 = param1.localizationId;
         var_717 = param1.priceInCredits;
         var_716 = param1.priceInPixels;
         var_601 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(_loc4_.productType);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_362;
      }
      
      public function get page() : ICatalogPage
      {
         return var_601;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1604 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_363;
      }
      
      public function get localizationId() : String
      {
         return var_1064;
      }
      
      public function get offerId() : int
      {
         return var_1065;
      }
      
      public function get priceInPixels() : int
      {
         return var_716;
      }
      
      public function dispose() : void
      {
         var_1065 = 0;
         var_1064 = "";
         var_717 = 0;
         var_716 = 0;
         var_601 = null;
         if(var_363 != null)
         {
            var_363.dispose();
            var_363 = null;
         }
      }
      
      public function get priceType() : String
      {
         return var_507;
      }
      
      public function get previewCallbackId() : int
      {
         return var_1604;
      }
      
      public function get priceInCredits() : int
      {
         return var_717;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_362 = const_441;
            }
            else
            {
               var_362 = const_349;
            }
         }
         else if(param1.length > 1)
         {
            var_362 = const_472;
         }
         else
         {
            var_362 = const_1102;
         }
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_362)
         {
            case const_441:
               var_363 = new SingleProductContainer(this,param1);
               break;
            case const_349:
               var_363 = new MultiProductContainer(this,param1);
               break;
            case const_472:
               var_363 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_362);
         }
      }
      
      private function analyzePriceType() : void
      {
         if(var_717 > 0 && var_716 > 0)
         {
            var_507 = const_355;
         }
         else if(var_717 > 0)
         {
            var_507 = const_309;
         }
         else if(var_716 > 0)
         {
            var_507 = const_364;
         }
         else
         {
            var_507 = const_967;
         }
      }
   }
}
