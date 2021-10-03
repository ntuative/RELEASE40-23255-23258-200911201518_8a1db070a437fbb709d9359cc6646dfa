package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_531:int = 6;
      
      public static const const_200:int = 5;
      
      public static const const_584:int = 2;
      
      public static const const_320:int = 9;
      
      public static const const_254:int = 4;
      
      public static const const_221:int = 2;
      
      public static const const_664:int = 4;
      
      public static const const_191:int = 8;
      
      public static const const_644:int = 7;
      
      public static const const_233:int = 3;
      
      public static const const_281:int = 1;
      
      public static const const_199:int = 5;
      
      public static const const_400:int = 12;
      
      public static const const_286:int = 1;
      
      public static const const_395:int = 11;
      
      public static const const_614:int = 3;
      
      public static const const_1502:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_382:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_382 = new Array();
         var_382.push(new Tab(_navigator,const_281,const_400,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_463));
         var_382.push(new Tab(_navigator,const_221,const_286,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_463));
         var_382.push(new Tab(_navigator,const_254,const_395,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_592));
         var_382.push(new Tab(_navigator,const_233,const_200,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_463));
         var_382.push(new Tab(_navigator,const_199,const_191,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_630));
         setSelectedTab(const_281);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_382)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_382)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_382)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_254;
      }
      
      public function get tabs() : Array
      {
         return var_382;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
