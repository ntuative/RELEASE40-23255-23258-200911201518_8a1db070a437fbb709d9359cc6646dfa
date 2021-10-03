package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public class InventoryMainView
   {
       
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_641:String;
      
      private var var_2184:IWindowContainer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_27:IFrameWindow;
      
      private var var_642:String;
      
      private var var_776:Boolean = true;
      
      private var var_1158:IWindowContainer;
      
      private var _controller:HabboInventory;
      
      private var var_195:IHabboToolbar;
      
      public function InventoryMainView(param1:HabboInventory, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         _controller = param1;
         _assetLibrary = param3;
         _windowManager = param2;
         var _loc4_:IAsset = _assetLibrary.getAssetByName("inventory_xml");
         var _loc5_:XmlAsset = XmlAsset(_loc4_);
         var _loc6_:ICoreWindowManager = ICoreWindowManager(_windowManager);
         var_27 = _loc6_.buildFromXML(XML(_loc5_.content)) as IFrameWindow;
         if(var_27 != null)
         {
            var_27.visible = false;
            var_27.procedure = windowEventProc;
            setCreditBalance(0);
            setPixelBalance(0);
            setClubStatus(0,0);
         }
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type == WindowEvent.const_53)
         {
            _loc3_ = ITabContextWindow(param2).selector.getSelected().name;
            if(_loc3_ != var_642)
            {
               _controller.toggleInventoryPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(param2.name == "header_button_close")
            {
               hideInventory();
            }
         }
      }
      
      public function hideInventory() : void
      {
         _controller.closingInventoryView();
         var _loc1_:IWindow = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = false;
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         _controller.checkCategoryInitilization(param1);
         var _loc2_:ITabContextWindow = var_27.findChildByName("contentArea") as ITabContextWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.container.removeChild(var_1158);
         _loc2_.invalidate();
         var _loc3_:IWindowContainer = _controller.getCategoryWindowContainer(param1);
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = true;
         _loc2_.container.addChild(_loc3_);
         var_1158 = _loc3_;
         var_642 = param1;
         _loc2_.selector.setSelected(_loc2_.selector.getSelectableByName(param1));
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_79)
         {
         }
         if(param1.iconId != HabboToolbarIconEnum.INVENTORY)
         {
            return;
         }
         if(param1.type == HabboToolbarEvent.const_58)
         {
            if(var_642 == InventoryCategory.const_155)
            {
               toggleCategoryView(InventoryCategory.const_155);
            }
            else if(var_642 == InventoryCategory.const_68)
            {
               toggleCategoryView(InventoryCategory.const_68);
            }
            else if(_controller != null)
            {
               _controller.toggleInventoryPage(InventoryCategory.const_68);
            }
         }
      }
      
      public function toggleSubCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(var_641 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               setSubViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            if(param1 != var_641)
            {
               setSubViewToCategory(param1);
            }
            if(var_195 != null && var_776)
            {
               var_195.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
            }
         }
      }
      
      public function setClubStatus(param1:int, param2:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.clubdays","months",String(param1));
         _windowManager.registerLocalizationParameter("inventory.purse.clubdays","days",String(param2));
      }
      
      public function updateSubCategoryView() : void
      {
         if(var_641 == null)
         {
            return;
         }
         setSubViewToCategory(var_641);
      }
      
      public function dispose() : void
      {
         _controller = null;
         var_27 = null;
         var_1158 = null;
         var_195 = null;
         _windowManager = null;
      }
      
      public function setCreditBalance(param1:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.creditbalance","balance",String(param1));
      }
      
      public function getWindow() : IFrameWindow
      {
         return var_27;
      }
      
      public function setHabboToolbarIcon() : void
      {
         if(var_195 != null)
         {
            var_195.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_106,HabboToolbarIconEnum.INVENTORY));
         }
      }
      
      private function setSubViewToCategory(param1:String) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         _controller.checkCategoryInitilization(param1);
         var _loc2_:IWindowContainer = var_27.findChildByName("subContentArea") as IWindowContainer;
         while(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         var _loc3_:IWindowContainer = _controller.getCategorySubWindowContainer(param1);
         if(_loc3_ != null)
         {
            _loc2_.visible = true;
            _loc3_.visible = true;
            _loc2_.height = _loc3_.height;
            _loc2_.addChild(_loc3_);
         }
         else
         {
            _loc2_.visible = false;
            _loc2_.height = 0;
         }
         var_27.resizeToFitContent();
         var_2184 = _loc3_;
         var_641 = param1;
         if(var_195 != null)
         {
            var_195.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_719,HabboToolbarIconEnum.INVENTORY,var_27 as IWindowContainer));
         }
      }
      
      public function showInventory() : void
      {
         var _loc1_:IWindow = getWindow();
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.visible = true;
         if(var_195 != null && var_776)
         {
            var_195.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.INVENTORY,_loc1_ as IWindowContainer));
            var_776 = false;
         }
         _controller.inventoryViewOpened(var_641);
      }
      
      public function get isVisible() : Boolean
      {
         return !!var_27 ? false : false;
      }
      
      public function getCategoryViewId() : String
      {
         return var_642;
      }
      
      public function getSubCategoryViewId() : String
      {
         return var_641;
      }
      
      public function setToolbar(param1:IHabboToolbar) : void
      {
         var_195 = param1;
         var_195.events.addEventListener(HabboToolbarEvent.const_79,onHabboToolbarEvent);
         var_195.events.addEventListener(HabboToolbarEvent.const_58,onHabboToolbarEvent);
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:IWindow = getWindow();
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.visible)
         {
            if(var_642 == param1)
            {
               if(param2)
               {
                  _loc3_.visible = false;
               }
            }
            else
            {
               setViewToCategory(param1);
            }
         }
         else
         {
            _loc3_.visible = true;
            _loc3_.activate();
            if(param1 != var_642 || !_controller.isInventoryCategoryInit(param1))
            {
               setViewToCategory(param1);
            }
            if(var_195 != null && var_776)
            {
               var_195.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_44,HabboToolbarIconEnum.INVENTORY,_loc3_ as IWindowContainer));
               var_776 = false;
            }
            _controller.inventoryViewOpened(param1);
         }
      }
      
      public function setPixelBalance(param1:int) : void
      {
         _windowManager.registerLocalizationParameter("inventory.purse.pixelbalance","balance",String(param1));
      }
   }
}
