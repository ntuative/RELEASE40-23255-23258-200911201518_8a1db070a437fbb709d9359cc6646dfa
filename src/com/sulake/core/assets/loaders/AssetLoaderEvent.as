package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_882:String = "AssetLoaderEventUnload";
      
      public static const const_46:String = "AssetLoaderEventError";
      
      public static const const_771:String = "AssetLoaderEventOpen";
      
      public static const const_787:String = "AssetLoaderEventProgress";
      
      public static const const_930:String = "AssetLoaderEventStatus";
      
      public static const const_30:String = "AssetLoaderEventComplete";
       
      
      private var var_349:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_349 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_349;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_349);
      }
   }
}
