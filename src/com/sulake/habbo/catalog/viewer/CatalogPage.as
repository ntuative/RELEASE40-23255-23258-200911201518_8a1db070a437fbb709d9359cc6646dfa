package com.sulake.habbo.catalog.viewer
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.viewer.widgets.BotCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.CatalogWidgetEnum;
   import com.sulake.habbo.catalog.viewer.widgets.ColourGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ICatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGridCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ItemGroupCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.LocalizationCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PetsCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.ProductViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurchaseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.PurseCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RecyclerPrizesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.RedeemItemCodeCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SingleViewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpacesCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.SpecialInfoWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TextInputCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TraxPreviewCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.TrophyCatalogWidget;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetsInitializedEvent;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import flash.events.Event;
   
   public class CatalogPage implements ICatalogPage
   {
      
      protected static const const_1341:String = "ctlg_";
       
      
      private var _localization:IPageLocalization;
      
      protected var var_1285:XML;
      
      protected var _window:IWindowContainer;
      
      private var var_841:String;
      
      private var var_1267:EventDispatcher;
      
      private var _widgets:Array;
      
      private var _pageId:int;
      
      private var var_782:ICatalogViewer;
      
      private var var_899:Array;
      
      public function CatalogPage(param1:ICatalogViewer, param2:int, param3:String, param4:IPageLocalization, param5:Array)
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         _widgets = [];
         super();
         var_782 = param1;
         _pageId = param2;
         var_841 = param3;
         _localization = param4;
         var_899 = new Array();
         for each(_loc6_ in param5)
         {
            _loc7_ = new Offer(_loc6_,this);
            if(_loc7_.productContainer != null)
            {
               var_899.push(_loc7_);
            }
            else
            {
               _loc7_.dispose();
            }
         }
         var_1267 = new EventDispatcher();
         _widgets = new Array();
         init();
      }
      
      public function get hasLinks() : Boolean
      {
         return _localization.hasLinks(var_841);
      }
      
      public function get pageId() : int
      {
         return _pageId;
      }
      
      protected function createWindow(param1:String) : void
      {
         var _loc2_:String = const_1341 + param1;
         var _loc3_:XmlAsset = viewer.catalog.assets.getAssetByName(_loc2_) as XmlAsset;
         if(_loc3_ == null)
         {
            Logger.log("Could not find asset for layout " + _loc2_);
            return;
         }
         var_1285 = _loc3_.content as XML;
         _window = viewer.catalog.windowManager.buildFromXML(var_1285) as IWindowContainer;
         if(_window == null)
         {
            Logger.log("Could not create layout " + param1);
         }
      }
      
      public function init() : void
      {
         createWindow(layoutCode);
         createWidgets();
      }
      
      public function get viewer() : ICatalogViewer
      {
         return var_782;
      }
      
      private function createWidgets() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_window == null)
         {
            return;
         }
         _widgets.push(new LocalizationCatalogWidget(_window));
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1266) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new ItemGridCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1094) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new ItemGroupCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1221) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new ProductViewCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1224) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new SingleViewCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1255) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new PurchaseCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1234) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new PurseCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1336) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new ColourGridCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1091) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new TraxPreviewCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1129) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new RedeemItemCodeCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1135) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new SpacesCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1305) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new TrophyCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1307) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new PetsCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1285) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new BotCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1222) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new TextInputCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1124) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new SpecialInfoWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1120) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new RecyclerCatalogWidget(_loc1_));
         }
         _loc1_ = _window.findChildByName(CatalogWidgetEnum.const_1301) as IWindowContainer;
         if(_loc1_ != null)
         {
            _widgets.push(new RecyclerPrizesCatalogWidget(_loc1_));
         }
         for each(_loc2_ in _widgets)
         {
            _loc2_.page = this;
            _loc2_.events = var_1267;
            _loc2_.init();
         }
         var_1267.dispatchEvent(new CatalogWidgetsInitializedEvent());
      }
      
      public function get offers() : Array
      {
         return var_899;
      }
      
      private function localize() : void
      {
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in _widgets)
         {
            _loc1_.dispose();
         }
         _widgets = null;
         _localization.dispose();
         for each(_loc2_ in var_899)
         {
            _loc2_.dispose();
         }
         if(_window != null)
         {
            _window.dispose();
         }
         _window = null;
         var_782 = null;
         var_1285 = null;
         _pageId = 0;
         var_841 = "";
      }
      
      public function dispatchWidgetEvent(param1:Event) : Boolean
      {
         return var_1267.dispatchEvent(param1);
      }
      
      public function get localization() : IPageLocalization
      {
         return _localization;
      }
      
      public function get layoutCode() : String
      {
         return var_841;
      }
      
      public function get links() : Array
      {
         return _localization.getLinks(var_841);
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
   }
}
