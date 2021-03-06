package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDropMenuWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.pets.IPetColor;
   import com.sulake.habbo.avatar.pets.IPetData;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetApproveNameResultEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class PetsCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_399:int = 0;
      
      private var var_472:Boolean = false;
      
      private var var_296:Array;
      
      private var var_808:int = -1;
      
      private var var_1457:int = 0;
      
      private var _name:String;
      
      private var var_899:Map;
      
      private var var_989:int;
      
      public function PetsCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function getPurchaseParameters() : String
      {
         if(_name == null || false)
         {
            page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.empty}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return "";
         }
         if(var_399 >= var_296.length)
         {
            return "";
         }
         var petColor:IPetColor = var_296[var_399] as IPetColor;
         var color:uint = petColor.rgb;
         var p:String = _name + String.fromCharCode(10) + addZeroPadding(String(var_1457),3) + String.fromCharCode(10) + addZeroPadding(color.toString(16).toUpperCase(),6);
         return p;
      }
      
      private function onTextWindowEvent(param1:WindowEvent) : void
      {
         var _loc2_:ITextFieldWindow = param1.target as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _name = _loc2_.text;
      }
      
      private function getRaceLocalizationKey(param1:int, param2:int) : String
      {
         return "pet.race." + param1 + "." + addZeroPadding(String(param2),3);
      }
      
      private function onColourIndex(param1:CatalogWidgetColourIndexEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_399 = param1.index;
         if(var_399 < 0 || var_399 > var_296.length)
         {
            var_399 = 0;
         }
         updateImage();
      }
      
      private function onApproveNameResult(param1:CatalogWidgetApproveNameResultEvent) : void
      {
         var event:CatalogWidgetApproveNameResultEvent = param1;
         if(event == null || !var_472)
         {
            return;
         }
         var_472 = false;
         switch(event.result)
         {
            case 1:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.length}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 2:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.chars}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 3:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.bobba}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               return;
            case 4:
               page.viewer.catalog.windowManager.alert("${catalog.alert.purchaseerror.title}","${catalog.alert.petname.taken}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
         }
         var p:String = getPurchaseParameters();
         if(p == "")
         {
            Logger.log("* Not enough information to buy a pet!");
            return;
         }
         Logger.log("* Will buy pet as " + p);
         (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_899.getWithIndex(0),page,p);
      }
      
      override public function init() : void
      {
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         super.init();
         var_472 = false;
         var _loc1_:IWindow = window.findChildByName("ctlg_buy_button");
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onBuyButtonEvent);
         var _loc2_:ITextFieldWindow = window.findChildByName("name_input_text") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.addEventListener(WindowEvent.const_232,onTextWindowEvent);
         var_899 = new Map();
         var _loc3_:Array = new Array();
         var _loc4_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         if(page.offers.length == 0)
         {
            return;
         }
         var _loc5_:Offer = page.offers[0];
         var_808 = getPetTypeIndexFromProduct(_loc5_.localizationId);
         var_989 = 0;
         var_296 = [];
         if(page && false && page.viewer.catalog)
         {
            _loc10_ = page.viewer.catalog as HabboCatalog;
            if(_loc10_ && _loc10_.avatarRenderManager && _loc10_.avatarRenderManager.petDataManager)
            {
               _loc11_ = _loc10_.avatarRenderManager.petDataManager.getPetData(var_808);
               if(_loc11_)
               {
                  var_989 = _loc11_.breeds.length;
                  var_296 = _loc11_.colors;
                  if(var_296 == null)
                  {
                     var_296 = [];
                  }
               }
            }
         }
         var _loc6_:int = 0;
         while(_loc6_ < var_989)
         {
            _loc3_.push(_loc4_.getKey(getRaceLocalizationKey(var_808,_loc6_),getRaceLocalizationKey(var_808,_loc6_)));
            _loc6_++;
         }
         var_899.add(var_808,_loc5_);
         var _loc7_:IDropMenuWindow = window.findChildByName("type_drop_menu") as IDropMenuWindow;
         if(_loc7_ == null)
         {
            return;
         }
         if(_loc3_.length > 1)
         {
            _loc7_.populate(_loc3_);
            _loc7_.selection = 0;
            _loc7_.procedure = onDropMenuEvent;
         }
         else
         {
            _loc7_.visible = false;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.CWE_COLOUR_INDEX,onColourIndex);
         events.addEventListener(WidgetEvent.const_766,onApproveNameResult);
         _loc5_ = var_899.getWithIndex(0);
         if(_loc5_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc5_));
         }
         var _loc8_:* = [];
         for each(_loc9_ in var_296)
         {
            _loc8_.push(_loc9_.rgb);
         }
         events.dispatchEvent(new CatalogWidgetColoursEvent(_loc8_,"ctlg_clr_27x22_1","ctlg_clr_27x22_2","ctlg_clr_27x22_3"));
      }
      
      private function getPetTypeIndexFromProduct(param1:String) : int
      {
         if(param1.length == 0)
         {
            return 0;
         }
         return int(param1.charAt(param1.length - 1));
      }
      
      override public function dispose() : void
      {
         var_472 = false;
         super.dispose();
      }
      
      private function onBuyButtonEvent(param1:WindowEvent) : void
      {
         if(var_472)
         {
            Logger.log("* Cannot buy a pet, pending previous name approval.");
         }
         if(getPurchaseParameters() == "")
         {
            return;
         }
         var_472 = true;
         (page.viewer.catalog as HabboCatalog).approveName(_name,1);
      }
      
      private function addZeroPadding(param1:String, param2:int) : String
      {
         while(param1.length < param2)
         {
            param1 = "0" + param1;
         }
         return param1;
      }
      
      public function onDropMenuEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowEvent.const_53)
         {
            _loc3_ = IDropMenuWindow(param2).selection;
            if(_loc3_ >= var_989)
            {
               return;
            }
            var_1457 = _loc3_;
            updateImage();
         }
      }
      
      private function setPreviewImage(param1:BitmapData) : void
      {
         if(false)
         {
            return;
         }
         if(param1 == null)
         {
            param1 = new BitmapData(1,1);
         }
         var _loc2_:IBitmapWrapperWindow = window.findChildByName("ctlg_teaserimg_1") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.bitmap == null)
         {
            _loc2_.bitmap = new BitmapData(_loc2_.width,_loc2_.height,true,16777215);
         }
         _loc2_.bitmap.fillRect(_loc2_.bitmap.rect,16777215);
         var _loc4_:BitmapData = new BitmapData(param1.width * 2,param1.height * 2,true,16777215);
         _loc4_.draw(param1,new Matrix(2,0,0,2));
         var _loc5_:Point = new Point((_loc2_.width - _loc4_.width) / 2,(_loc2_.height - _loc4_.height) / 2);
         _loc2_.bitmap.copyPixels(_loc4_,_loc4_.rect,_loc5_,null,null,true);
         _loc2_.invalidate();
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         updateImage();
      }
      
      private function updateImage() : void
      {
         var _loc6_:* = null;
         var _loc1_:Offer = var_899.getWithIndex(0);
         if(_loc1_ == null)
         {
            return;
         }
         var _loc2_:* = 0;
         if(var_399 >= 0 && var_399 < var_296.length)
         {
            _loc6_ = var_296[var_399] as IPetColor;
            if(_loc6_ != null)
            {
               _loc2_ = uint(_loc6_.rgb);
            }
         }
         var _loc3_:IAvatarImage = (page.viewer.catalog as HabboCatalog).avatarRenderManager.createPetImageNew(var_808,var_1457,_loc2_,AvatarScaleType.const_50);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.initActionAppends();
         _loc3_.appendAction(AvatarAction.const_285,AvatarAction.const_502);
         _loc3_.endActionAppends();
         _loc3_.setDirection(AvatarSetType.const_37,2);
         setPreviewImage(_loc3_.getCroppedImage(AvatarSetType.const_37).clone());
         _loc3_.dispose();
         var _loc4_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var _loc5_:ITextWindow = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         if(_loc5_ != null)
         {
            _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc1_.priceInCredits));
            _loc5_.caption = "${catalog.purchase.price.credits}";
         }
      }
   }
}
