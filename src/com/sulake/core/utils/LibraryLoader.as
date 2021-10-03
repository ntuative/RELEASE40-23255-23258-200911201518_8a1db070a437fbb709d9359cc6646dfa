package com.sulake.core.utils
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import flash.display.DisplayObject;
   import flash.display.FrameLabel;
   import flash.display.Loader;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   import flash.utils.ByteArray;
   
   public class LibraryLoader extends EventDispatcher implements IDisposable
   {
      
      protected static const const_1340:uint = 2;
      
      protected static const const_1337:uint = 1;
      
      protected static const const_1539:int = 5;
      
      protected static const const_982:uint = 7;
      
      protected static const const_1338:uint = 4;
      
      protected static const const_1339:uint = 3;
       
      
      protected var var_1027:int;
      
      protected var var_2136:String = "";
      
      protected var var_349:int;
      
      protected var var_438:XML;
      
      protected var var_1280:Boolean = false;
      
      protected var var_412:uint = 0;
      
      protected var var_1:Loader;
      
      protected var var_2135:String = "";
      
      protected var var_350:URLRequest;
      
      protected var var_859:Boolean = false;
      
      protected var _name:String;
      
      protected var var_314:Class;
      
      protected var var_2245:uint = 0;
      
      protected var _context:LoaderContext;
      
      public function LibraryLoader(param1:Boolean)
      {
         var_859 = param1;
         var_349 = 0;
         var_1 = new Loader();
         var_1.contentLoaderInfo.addEventListener(Event.INIT,loadEventHandler);
         var_1.contentLoaderInfo.addEventListener(Event.COMPLETE,loadEventHandler);
         var_1.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_1.contentLoaderInfo.addEventListener(Event.UNLOAD,loadEventHandler);
         var_1.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_1.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_1.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         super();
      }
      
      protected function failure(param1:String) : void
      {
         var_2135 = param1;
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,var_349));
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get resource() : Class
      {
         return var_314;
      }
      
      public function get request() : URLRequest
      {
         return var_350;
      }
      
      public function getLastErrorMessage() : String
      {
         return var_2135;
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         return var_1.contentLoaderInfo.applicationDomain.hasDefinition(param1);
      }
      
      public function get bytesTotal() : uint
      {
         return var_1.contentLoaderInfo.bytesTotal;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            try
            {
               var_1.close();
            }
            catch(e:*)
            {
            }
            var_1.unload();
            var_1 = null;
            _context = null;
            var_314 = null;
            var_438 = null;
            super.dispose();
         }
      }
      
      public function get ready() : Boolean
      {
         return var_1280;
      }
      
      public function get manifest() : XML
      {
         return var_438;
      }
      
      protected function prepareLibrary() : void
      {
         var xmlClass:Class = null;
         debug("Preparing library \"" + _name + "\"");
         var_314 = this.getDefinition(_name) as Class;
         if(var_314 == null)
         {
            failure("Failed to find resource class in library undefined!");
            return;
         }
         try
         {
            xmlClass = var_314.manifest as Class;
            if(xmlClass == null)
            {
               return;
            }
         }
         catch(e:Error)
         {
            failure("Failed to find embedded manifest.xml in library undefined!");
            return;
         }
         var bytes:ByteArray = new xmlClass() as ByteArray;
         var_438 = new XML(bytes.readUTFBytes(bytes.length));
      }
      
      public function get domain() : ApplicationDomain
      {
         return var_1.contentLoaderInfo.applicationDomain;
      }
      
      public function getDefinition(param1:String) : Object
      {
         if(var_1.contentLoaderInfo.applicationDomain.hasDefinition(param1))
         {
            return var_1.contentLoaderInfo.applicationDomain.getDefinition(param1);
         }
         return null;
      }
      
      protected function analyzeLibrary() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc1_:DisplayObject = var_1.content;
         debug("Analyzing library \"" + _name + "\", content " + (_loc1_ is MovieClip ? "is" : "is not") + " a MovieClip");
         debug("\tBytes loaded: " + var_1.contentLoaderInfo.bytesLoaded + "/" + var_1.contentLoaderInfo.bytesTotal);
         if(_loc1_ is MovieClip)
         {
            _loc2_ = _loc1_ as MovieClip;
            _loc4_ = _loc2_.currentLabels;
            debug("\tLibrary \"" + _name + "\" is in frame " + _loc2_.currentFrame + "(" + _loc2_.currentLabel + ")");
            if(_loc4_.length > 1)
            {
               _loc5_ = 0;
               while(_loc5_ < _loc4_.length)
               {
                  _loc3_ = _loc4_[_loc5_] as FrameLabel;
                  if(_loc3_.name == _name)
                  {
                     if(_loc3_.frame != _loc2_.currentFrame)
                     {
                        _loc2_.addEventListener(Event.ENTER_FRAME,loadEventHandler);
                        return false;
                     }
                  }
                  _loc5_++;
               }
            }
         }
         return true;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_1.contentLoaderInfo.bytesLoaded;
      }
      
      protected function debug(param1:String) : void
      {
         var_2136 = param1;
         if(var_859)
         {
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_DEBUG,var_349));
         }
      }
      
      protected function loadEventHandler(param1:Event) : void
      {
         switch(param1.type)
         {
            case Event.INIT:
               debug("Load event INIT for file \"" + var_1.contentLoaderInfo.url + "\"");
               var_412 |= 0;
               break;
            case Event.COMPLETE:
               debug("Load event COMPLETE for file \"" + var_1.contentLoaderInfo.url + "\"");
               var_412 |= 0;
               break;
            case Event.ENTER_FRAME:
               break;
            case HTTPStatusEvent.HTTP_STATUS:
               var_349 = HTTPStatusEvent(param1).status;
               debug("Load event STATUS " + var_349 + " for file \"" + var_1.contentLoaderInfo.url + "\"");
               break;
            case Event.UNLOAD:
               debug("Load event UNLOAD for file \"" + var_1.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_UNLOAD,var_349));
               break;
            case ProgressEvent.PROGRESS:
               debug("Load event PROGRESS for file \"" + var_1.contentLoaderInfo.url + "\"");
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,var_349));
               break;
            case IOErrorEvent.IO_ERROR:
               failure("IO Error, send or load operation failed for file \"" + var_1.contentLoaderInfo.url + "\"");
               if(!handleHttpStatus(var_349))
               {
                  removeEventListeners();
               }
               break;
            case SecurityErrorEvent.SECURITY_ERROR:
               failure("Security Error, security violation with file \"" + var_1.contentLoaderInfo.url + "\"");
               removeEventListeners();
               break;
            default:
               Logger.log("LibraryLoader::loadEventHandler(" + param1 + ")");
         }
         if(var_412 == LibraryLoader.const_1339)
         {
            if(analyzeLibrary())
            {
               var_412 |= 0;
            }
         }
         if(var_412 == LibraryLoader.const_982)
         {
            var_1280 = true;
            prepareLibrary();
            removeEventListeners();
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,var_349));
         }
      }
      
      public function getLastDebugMessage() : String
      {
         return var_2136;
      }
      
      protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 >= 400)
         {
            if(var_1027 > 0)
            {
               var_1.close();
               var_1.unload();
               var_1.load(var_350,_context);
               --var_1027;
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_1.contentLoaderInfo.url + "\"");
            removeEventListeners();
         }
         return false;
      }
      
      protected function removeEventListeners() : void
      {
         if(false)
         {
            var_1.content.removeEventListener(Event.ENTER_FRAME,loadEventHandler);
         }
         var_1.contentLoaderInfo.removeEventListener(Event.INIT,loadEventHandler);
         var_1.contentLoaderInfo.removeEventListener(Event.COMPLETE,loadEventHandler);
         var_1.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_1.contentLoaderInfo.removeEventListener(Event.UNLOAD,loadEventHandler);
         var_1.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_1.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_1.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
      }
      
      public function get status() : int
      {
         return var_349;
      }
      
      public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 5) : void
      {
         var _loc4_:int = 0;
         var_1280 = false;
         var_350 = param1;
         if(param2 == null)
         {
            _context = new LoaderContext();
            _context.applicationDomain = ApplicationDomain.currentDomain;
         }
         else
         {
            _context = param2;
         }
         var_1027 = param3;
         _name = var_350.url;
         _loc4_ = _name.indexOf("?",0);
         if(_loc4_ > -1)
         {
            _name = _name.slice(0,_loc4_);
         }
         _loc4_ = _name.lastIndexOf(".");
         if(_loc4_ > -1)
         {
            _name = _name.slice(0,_loc4_);
         }
         _loc4_ = _name.lastIndexOf("/");
         if(_loc4_ > -1)
         {
            _name = _name.slice(_loc4_ + 1,_name.length);
         }
         var_1.load(var_350,_context);
      }
      
      public function get url() : String
      {
         return var_350.url;
      }
   }
}
