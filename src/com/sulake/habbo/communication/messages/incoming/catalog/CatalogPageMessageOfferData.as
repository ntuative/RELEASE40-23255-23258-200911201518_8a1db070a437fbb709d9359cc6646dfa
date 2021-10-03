package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_735:Array;
      
      private var var_717:int;
      
      private var var_1064:String;
      
      private var var_1065:int;
      
      private var var_716:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         var_1065 = param1.readInteger();
         var_1064 = param1.readString();
         var_717 = param1.readInteger();
         var_716 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_735 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_735.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_735;
      }
      
      public function get priceInCredits() : int
      {
         return var_717;
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
   }
}
