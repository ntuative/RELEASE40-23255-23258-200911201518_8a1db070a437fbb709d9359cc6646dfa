package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1469:GarbageMonitor = null;
      
      private var var_1055:int = 0;
      
      private var var_1097:Boolean = false;
      
      private var var_1743:String = "";
      
      private var var_1470:String = "";
      
      private var var_342:Number = 0;
      
      private var var_1246:int = 10;
      
      private var var_2196:Array;
      
      private var var_574:int = 0;
      
      private var var_1247:int = 60;
      
      private var var_1000:int = 0;
      
      private var var_1001:int = 0;
      
      private var var_1738:String = "";
      
      private var var_2054:Number = 0;
      
      private var var_1244:int = 1000;
      
      private var var_2053:Boolean = true;
      
      private var var_2055:Number = 0.15;
      
      private var var_177:IHabboConfigurationManager = null;
      
      private var var_1744:String = "";
      
      private var var_1245:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2196 = [];
         super();
         var_1470 = Capabilities.version;
         var_1743 = Capabilities.os;
         var_1097 = Capabilities.isDebugger;
         var_1744 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1469 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1055 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1469.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1469.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_342;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1247 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1470;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1001;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1244)
         {
            ++var_1000;
            _loc3_ = true;
         }
         else
         {
            ++var_574;
            if(var_574 <= 1)
            {
               var_342 = param1;
            }
            else
            {
               _loc4_ = Number(var_574);
               var_342 = var_342 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1055 > var_1247 * 1000 && var_1245 < var_1246)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_342);
            _loc5_ = true;
            if(var_2053 && var_1245 > 0)
            {
               _loc6_ = differenceInPercents(var_2054,var_342);
               if(_loc6_ < var_2055)
               {
                  _loc5_ = false;
               }
            }
            var_1055 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2054 = var_342;
               if(sendReport())
               {
                  ++var_1245;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1246 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1244 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_1744,var_1470,var_1743,var_1738,var_1097,_loc4_,_loc3_,var_1001,var_342,var_1000);
            _connection.send(_loc1_);
            var_1001 = 0;
            var_342 = 0;
            var_574 = 0;
            var_1000 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_177 = param1;
         var_1247 = int(var_177.getKey("performancetest.interval","60"));
         var_1244 = int(var_177.getKey("performancetest.slowupdatelimit","1000"));
         var_1246 = int(var_177.getKey("performancetest.reportlimit","10"));
         var_2055 = Number(var_177.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2053 = Boolean(int(var_177.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
