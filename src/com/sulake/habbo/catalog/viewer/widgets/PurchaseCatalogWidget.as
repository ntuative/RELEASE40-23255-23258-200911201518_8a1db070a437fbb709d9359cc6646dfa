package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1556:XML;
      
      private var var_1301:ITextWindow;
      
      private var var_1303:ITextWindow;
      
      private var var_1557:XML;
      
      private var var_705:IWindowContainer;
      
      private var var_2151:ITextWindow;
      
      private var var_1560:String = "";
      
      private var var_2218:IButtonWindow;
      
      private var var_1559:XML;
      
      private var var_1302:ITextWindow;
      
      private var var_1558:XML;
      
      private var var_706:IButtonWindow;
      
      private var var_168:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_309:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1557) as IWindowContainer;
               break;
            case Offer.const_364:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1558) as IWindowContainer;
               break;
            case Offer.const_355:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1556) as IWindowContainer;
               break;
            case Offer.const_599:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1559) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_705 != null)
            {
               _window.removeChild(var_705);
               var_705.dispose();
            }
            var_705 = _loc2_;
            _window.addChild(_loc2_);
            var_705.x = 0;
            var_705.y = 0;
         }
         var_1302 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1303 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1301 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2151 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_706 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_706 != null)
         {
            var_706.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_706.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_168 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_168,page,var_1560);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_1557 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_1558 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_1556 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_1559 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_931,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_1560 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_168 = param1.offer;
         attachStub(var_168.priceType);
         if(var_1302 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_168.priceInCredits));
            var_1302.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1303 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_168.priceInPixels));
            var_1303.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1301 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_168.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_168.priceInPixels));
            var_1301.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_706 != null)
         {
            var_706.enable();
         }
      }
   }
}
