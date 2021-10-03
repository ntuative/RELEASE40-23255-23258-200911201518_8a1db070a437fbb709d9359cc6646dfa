package com.sulake.core.runtime.events
{
   import com.sulake.core.runtime.IDisposable;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class EventDispatcher implements IEventDispatcher, IDisposable
   {
      
      private static const const_984:uint = 1;
      
      private static const const_474:uint = 0;
      
      private static const const_725:uint = 2;
       
      
      private var var_1298:Error;
      
      protected var _disposed:Boolean = false;
      
      private var var_241:Dictionary;
      
      private var var_68:flash.events.EventDispatcher;
      
      private var var_588:uint;
      
      public function EventDispatcher(param1:IEventDispatcher = null)
      {
         var_241 = new Dictionary();
         super();
         var_68 = new flash.events.EventDispatcher(!!param1 ? param1 : this);
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         if(!_disposed)
         {
            var_588 = const_474;
            var_68.dispatchEvent(param1);
            if(var_588 == const_725)
            {
               throw var_1298;
            }
            return var_588 == const_474;
         }
         return false;
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!_disposed ? false : false;
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         if(!_disposed)
         {
            _loc4_ = var_241[param1];
            if(_loc4_)
            {
               _loc5_ = 0;
               for each(_loc6_ in _loc4_)
               {
                  if(_loc6_.callback == param2 && _loc6_.var_2121 == param3)
                  {
                     _loc4_.splice(_loc5_,1);
                     _loc6_.callback = null;
                     if(_loc4_.length == 0)
                     {
                        delete var_241[param1];
                     }
                     return;
                  }
                  _loc5_++;
               }
            }
         }
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         var _loc8_:* = null;
         var _loc6_:Array = var_241[param1];
         var _loc7_:EventListenerStruct = new EventListenerStruct(param2,param3,param4,param5);
         if(!_loc6_)
         {
            _loc6_ = [_loc7_];
            var_241[param1] = _loc6_;
            var_68.addEventListener(param1,eventProcessor);
         }
         else
         {
            for each(_loc8_ in _loc6_)
            {
               if(_loc8_.callback == param2 && _loc8_.var_2121 == param3)
               {
                  return;
               }
               if(param4 > _loc8_.priority)
               {
                  _loc6_.splice(_loc6_.indexOf(_loc8_),0,_loc7_);
                  return;
               }
            }
            _loc6_.push(_loc7_);
         }
      }
      
      public function get error() : Error
      {
         return var_1298;
      }
      
      private function eventProcessor(param1:Event) : void
      {
         var callbacks:Array = null;
         var callback:Function = null;
         var struct:EventListenerStruct = null;
         var event:Event = param1;
         var array:Array = var_241[event.type];
         var isDebugBuild:Boolean = false;
         if(array)
         {
            callbacks = [];
            for each(struct in array)
            {
               callbacks.push(struct.callback);
            }
            while(callbacks.length > 0)
            {
               if(isDebugBuild)
               {
                  callback = callbacks.shift();
                  callback(event);
               }
               else
               {
                  try
                  {
                     callback = callbacks.shift();
                     callback(event);
                  }
                  catch(e:Error)
                  {
                     Logger.log(e);
                     var_588 = const_725;
                     var_1298 = e;
                     return;
                  }
               }
            }
         }
         var_588 = !!event.isDefaultPrevented() ? uint(const_984) : uint(const_474);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_disposed)
         {
            for(_loc1_ in var_241)
            {
               _loc2_ = var_241[_loc1_] as Array;
               for each(_loc3_ in _loc2_)
               {
                  _loc3_.callback = null;
               }
               delete var_241[_loc1_];
            }
            var_241 = null;
            var_68 = null;
            _disposed = true;
         }
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!_disposed ? false : false;
      }
   }
}