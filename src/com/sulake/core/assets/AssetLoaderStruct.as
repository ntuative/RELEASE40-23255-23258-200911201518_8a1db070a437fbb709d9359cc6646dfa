package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_587:IAssetLoader;
      
      private var var_1171:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1171 = param1;
         var_587 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_587;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_587 != null)
            {
               if(true)
               {
                  var_587.dispose();
                  var_587 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1171;
      }
   }
}
