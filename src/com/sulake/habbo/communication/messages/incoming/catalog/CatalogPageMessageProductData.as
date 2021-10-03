package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_272:String = "e";
      
      public static const const_139:String = "i";
      
      public static const const_154:String = "s";
       
      
      private var var_868:String;
      
      private var var_1038:String;
      
      private var var_1039:int;
      
      private var var_1982:int;
      
      private var var_867:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1038 = param1.readString();
         var_1982 = param1.readInteger();
         var_868 = param1.readString();
         var_867 = param1.readInteger();
         var_1039 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_867;
      }
      
      public function get productType() : String
      {
         return var_1038;
      }
      
      public function get expiration() : int
      {
         return var_1039;
      }
      
      public function get furniClassId() : int
      {
         return var_1982;
      }
      
      public function get extraParam() : String
      {
         return var_868;
      }
   }
}
